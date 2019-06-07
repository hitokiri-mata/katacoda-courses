#!/bin/sh

launch.sh

source <(kubectl completion bash)
source <(helm completion bash)

# Helm Setup
helm init --wait
helm repo update

# Setup dashboard on port 30000
helm install stable/kubernetes-dashboard --name dash --set=service.type=NodePort --set=enableInsecureLogin=true --set=service.nodePort=30000 --set=service.externalPort=80 --namespace kube-system

{ clear && echo 'Kubernetes with Helm is ready.'; } 2> /dev/null

# Need Java for Gradle build
sudo apt-get update --fix-missing
apt install -y openjdk-8-jdk-headless --fix-missing
