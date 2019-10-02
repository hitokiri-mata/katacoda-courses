#!/bin/sh

launch.sh

source <(kubectl completion bash)
source <(helm completion bash)

# Helm Setup
helm init --wait --tiller-tls-verify 
helm repo update

# Setup dashboard on port 30000
helm install stable/kubernetes-dashboard --name dash --set=service.type=NodePort --set=enableInsecureLogin=true --set=service.nodePort=30000 --set=service.externalPort=80 --namespace kube-system

# Enable metrics
helm install --name metrics-server --namespace kube-system stable/metrics-server

pause

{ clear && echo 'Kubernetes with Helm is ready.'; } 2> /dev/null