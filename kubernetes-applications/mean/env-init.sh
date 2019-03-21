#!/bin/sh

launch.sh

source <(kubectl completion bash)
source <(helm completion bash)

# Special for this project, upgrade Docker as this example uses a multi-stage dockerfile and it will fail because local Docker instance is version 17.03.0-ce and multi-stage builds are a new feature requiring Docker 17.05 or higher
# sudo apt-get update && sudo apt-get upgrade docker-engine
# sudo service docker start

# Helm Setup
helm init --wait
helm repo update

# Setup dashboard on port 30000
helm install stable/kubernetes-dashboard --name dash --set=service.type=NodePort --set=enableInsecureLogin=true --set=service.nodePort=30000 --set=service.externalPort=80 --namespace kube-system

{ clear && echo 'Kubernetes with Helm is ready.'; } 2> /dev/null
