#!/bin/sh

echo "Starting Kubernetes using Minikube..."

minikube config set WantUpdateNotification false
minikube start --insecure-registry localhost:5000

while [ `docker ps | wc -l` -eq 1 ]
do
  sleep 1
done

# Using minikube's Docker daemon from our localhost
# eval $(minikube docker-env)

# Running a local private Docker registry
minikube addons enable registry

# May be a few moments before registry service is ready to respond to a patch request
# Expose the Registry externally as a NodePort (use 'minikube service list' to find the URL of services)
for i in {1..5}; do \
kubectl patch service registry --namespace=kube-system --type='json' -p='[{"op": "replace",  "path": "/spec/type", "value":"NodePort"}]' \
&& break || echo 'Retrying NodePort adjustment...' && sleep 10; done

kubectl patch service registry --namespace=kube-system --type='json' --patch='[{"op": "replace",  "path": "/spec/ports/0/nodePort", "value":31500}]'

minikube completion bash
helm completion bash
kubectl completion bash

helm init --wait
helm repo update

minikube status

echo "Kubernetes using Minikube is ready."