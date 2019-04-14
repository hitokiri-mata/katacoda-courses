#!/bin/sh

launch.sh

minikube config set WantUpdateNotification false
source <(minikube completion bash)
source <(kubectl completion bash)
source <(helm completion bash)
clear

echo "Starting Kubernetes using Minikube..."
minikube start

# Dashboard for Minikube on port 30000
minikube addons enable dashboard
kubectl delete service kubernetes-dashboard -n kube-system
kubectl expose deployment kubernetes-dashboard -n kube-system --type=NodePort
kubectl patch service kubernetes-dashboard --namespace=kube-system --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":30000}]'
