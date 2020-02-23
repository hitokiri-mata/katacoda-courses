#!/bin/sh

# Log for analysis of startup
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>log.out 2>&1
# Everything below will go to the file 'log.out':

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

# Kubeflow

curl -LO http://assets.joinscrapbook.com/kubeflow/kfctl_v0.7.1-2-g55f9b2a_linux.tar.gz
tar -xvf kfctl_v0.7.1-2-g55f9b2a_linux.tar.gz
mv kfctl /usr/local/bin/
chmod +x /usr/local/bin/kfctl
rm kfctl_v0.7.1-2-g55f9b2a_linux.tar.gz

export KF_NAME=kf-test

export BASE_DIR=/opt
export KF_DIR=${BASE_DIR}/${KF_NAME}

export CONFIG_URI="https://raw.githubusercontent.com/kubeflow/manifests/v0.7-branch/kfdef/kfctl_k8s_istio.0.7.1.yaml"
rm -rf ${KF_DIR}
mkdir -p ${KF_DIR}

cd ${KF_DIR}

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

n=0
until [ $n -ge 5 ]
do
  rm -rf ${KF_DIR}
  mkdir -p ${KF_DIR}

  cd ${KF_DIR}
   kfctl apply -V -f ${CONFIG_URI} && break
   n=$[$n+1]
   sleep 2
done

kubectl -n kubeflow get all

# Completions
source <(kfctl completion bash)
source <(kubectl completion bash)
source <(helm completion bash)

{ clear && echo 'Kubernetes with Kubeflow and Helm is ready.'; } 2> /dev/null
