#!/bin/sh

launch.sh

# Helm Setup (v3.1.2)
FOLDER=helmer
mkdir $FOLDER && pushd $FOLDER
curl -fsSL -o helm.gz https://get.helm.sh/helm-v3.1.2-linux-amd64.tar.gz
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

# Completions
source <(kubectl completion bash)
source <(helm completion bash)

# { clear && echo 'Kubernetes with Kubeflow and Helm is ready.'; } 2> /dev/null
