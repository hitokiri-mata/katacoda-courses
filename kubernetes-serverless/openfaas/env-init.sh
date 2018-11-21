#!/bin/sh

# Minikube pre-setup
minikube config set WantUpdateNotification false
# TODO: There is a known issue with Katacoda when this is applied. Waiting to move to new version of Minikube.
# minikube config set bootstrapper kubeadm
source <(minikube completion bash)
source <(kubectl completion bash)
source <(helm completion bash)
clear

echo "Starting Kubernetes using Minikube..."
minikube start 

while [ `docker ps | wc -l` -eq 1 ]
do
  sleep 1
done

# Helm Setup
helm repo update
helm init --wait
clear 

minikube status

echo "Kubernetes using Minikube is ready."