#!/bin/sh

source <(kubectl completion bash)
source <(helm completion bash)

# Helm Setup
helm init --wait
helm repo update

# Setup dashboard via chart like minikube on 30000
helm install stable/kubernetes-dashboard --name dash --set=service.type=NodePort --set=enableInsecureLogin=true --set=service.nodePort=30000 --set=service.externalPort=80 --namespace kube-system

clear 

echo 'Kubernetes with Helm is ready.'