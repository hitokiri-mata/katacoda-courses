To setup Kubeflow on this Kubernetes cluster three things need to be completed:

1. Command line tool installation
2. Persistence reservation
3. Kubeflow framework installation

## Kubeflow CLI

```
curl -LO http://assets.joinscrapbook.com/kubeflow/kfctl_v0.7.1-2-g55f9b2a_linux.tar.gz
tar -xvf kfctl_v0.7.1-2-g55f9b2a_linux.tar.gz
mv kfctl /usr/local/bin/
chmod +x /usr/local/bin/kfctl
rm kfctl_v0.7.1-2-g55f9b2a_linux.tar.gz
```{{execute}}

Verify the command line tool is available.

`kfctl version`{{execute}}

Whenever you add a CLI tool, often there will be a completion feature.

`source <(kfctl completion bash)`{{execute}}


## Persistence

Create 10 Persistent Volumes that will eventually be bound to by Kubeflow services

```
for i in {1..10}; do
   cat pv.yaml | sed "s/volname/pv$i/g" | sed "s/volsize/50Gi/g" | sed "s#volpath#/opt/vol/pv$i#" | kubectl apply -f -
   mkdir -p "/opt/vol/pv$i"
   chmod 777 "/opt/vol/pv$i"
   ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no node01 "mkdir -p /opt/vol/pv$i; chmod 777 /opt/vol/pv$i"
done
```{{execute}}

## Installation

Prepare an installation folder and variables.

```
export BASE_DIR=/opt
export KF_NAME=kf-install
export KF_DIR=${BASE_DIR}/${KF_NAME}
export CONFIG_URI="https://raw.githubusercontent.com/kubeflow/manifests/v0.7-branch/kfdef/kfctl_k8s_istio.0.7.1.yaml"
rm -rf ${KF_DIR}
mkdir -p ${KF_DIR}
cd ${KF_DIR}
```{{execute}}

Using the kfctl tool Install Kubeflow. Unfortunatelly, due to some idempodency problem, the installation need to be tried in a loop until it works. We expect this problem will be addressed in the near future.

```
for i in {1..10}; do
  kfctl apply -V -f ${CONFIG_URI}

  EXITCODE=$?
  if [ $EXITCODE -eq 0 ]; then
    break;
  fi

  rm -rf *
  sleep 2
done
```{{execute}}
