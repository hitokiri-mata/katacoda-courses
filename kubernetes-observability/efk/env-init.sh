#!/bin/sh

launch.sh

source <(kubectl completion bash)
source <(helm completion bash)

# Setup dashboard on port 30000
helm install stable/kubernetes-dashboard --name dash --set=service.type=NodePort --set=enableInsecureLogin=true --set=service.nodePort=30000 --set=service.externalPort=80 --namespace kube-system

{ clear && echo 'Kubernetes with Helm is ready.'; } 2> /dev/null
