#!/bin/sh
echo "Starting Kubernetes using Minikube..."

minikube config set WantUpdateNotification false
minikube start 

while [ `docker ps | wc -l` -eq 1 ]
do
  sleep 1
done

minikube completion bash
helm completion bash
kubectl completion bash

helm init --wait
helm repo update

clear 

minikube status

echo "Kubernetes using Minikube is ready."