#!/bin/sh

launch.sh

# Helm Setup (v3.1.0)
FOLDER=helmer
mkdir $FOLDER && pushd $FOLDER
curl -fsSL -o helm.gz https://get.helm.sh/helm-v3.1.0-linux-amd64.tar.gz
tar -zxvf helm.gz
mv ./linux-amd64/helm /usr/local/bin
popd && rm -rf $FOLDER
helm repo add stable https://kubernetes-charts.storage.googleapis.com/

# Setup dashboard on port 30000
helm install dash stable/kubernetes-dashboard \
--namespace kube-system \
--set=service.type=NodePort \
--set=enableInsecureLogin=true \
--set=service.nodePort=30000 \
--set=service.externalPort=80

# Kubeflow CLI
curl -LO http://assets.joinscrapbook.com/kubeflow/kfctl_v0.7.1-2-g55f9b2a_linux.tar.gz
tar -xvf kfctl_v0.7.1-2-g55f9b2a_linux.tar.gz
mv kfctl /usr/local/bin/
chmod +x /usr/local/bin/kfctl
rm kfctl_v0.7.1-2-g55f9b2a_linux.tar.gz

# Kubeflow Persistence
cat <<EOF > /tmp/pv.yml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: volname
spec:
  capacity:
    storage: volsize
  accessModes:
    - ReadWriteOnce
    - ReadOnlyMany
    - ReadWriteMany
  persistentVolumeReclaimPolicy: Recycle
  hostPath:
    path: volpath
EOF

for i in `seq 10`; do
   cat /tmp/pv.yml | sed "s/volname/pv$i/g" | sed "s/volsize/50Gi/g" | sed "s#volpath#/opt/vol/pv$i#" | kubectl apply -f -
   mkdir -p "/opt/vol/pv$i"
   chmod 777 "/opt/vol/pv$i"
   ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no node01 "mkdir -p /opt/vol/pv$i; chmod 777 /opt/vol/pv$i"
done

# Install Kubeflow
export BASE_DIR=/opt
export KF_NAME=kf-test
export KF_DIR=${BASE_DIR}/${KF_NAME}
export CONFIG_URI="https://raw.githubusercontent.com/kubeflow/manifests/v0.7-branch/kfdef/kfctl_k8s_istio.0.7.1.yaml"
rm -rf ${KF_DIR}
mkdir -p ${KF_DIR}
cd ${KF_DIR}

# Install Kubeflow (insanity that we have to try it in a loop!)
i=0
while [ $i -le 8 ]
do
  kfctl apply -V -f ${CONFIG_URI}

  EXITCODE=$?
  if [ $EXITCODE -eq 0 ]; then
    break;
  fi

  echo Number: $i
  rm -rf *
  sleep 2
  ((i++))
done

# Completions
source <(kfctl completion bash)
source <(kubectl completion bash)
source <(helm completion bash)

# { clear && echo 'Kubernetes with Kubeflow and Helm is ready.'; } 2> /dev/null
