#!/bin/sh
minikube config set WantUpdateNotification false
minikube config set bootstrapper kubeadm
clear
echo "Starting Kubernetes using Minikube..."
minikube start 

while [ `docker ps | wc -l` -eq 1 ]
do
  sleep 1
done

source <(minikube completion bash)
source <(kubectl completion bash)
source <(helm completion bash)

helm init --wait
helm repo update

clear 

minikube status

echo "Kubernetes using Minikube is ready."