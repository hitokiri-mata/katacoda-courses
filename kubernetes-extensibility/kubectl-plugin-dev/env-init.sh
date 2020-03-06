#!/bin/sh

launch.sh

# Helm Setup (v3.1.1)
FOLDER=helmer
mkdir $FOLDER && pushd $FOLDER
curl -fsSL -o helm.gz https://get.helm.sh/helm-v3.1.1-linux-amd64.tar.gz
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

source <(kubectl completion bash)
source <(helm completion bash)

# Enable metrics - probes failing and crashing on this instance.
# helm install metrics-server stable/metrics-server --namespace kube-system 

mkdir dev && cd dev

{ clear && echo 'Kubernetes with Helm is ready.'; } 2> /dev/null