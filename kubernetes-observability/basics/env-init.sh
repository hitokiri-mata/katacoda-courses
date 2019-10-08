#!/bin/sh

launch.sh

source <(kubectl completion bash)
source <(helm completion bash)

# Helm Setup
helm init --wait
helm repo update

# Setup dashboard on port 30000
helm install stable/kubernetes-dashboard \
--name dash \
--namespace kube-system \
--set service.type=NodePort \
--set enableInsecureLogin=true \
--set service.nodePort=30000 \
--set service.externalPort=80

{ clear && echo 'Kubernetes with Helm is ready.'; } 2> /dev/null
