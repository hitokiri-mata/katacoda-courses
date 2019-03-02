#!/bin/sh

source <(kubectl completion bash)
source <(helm completion bash)

# Add Kubernetes dashboard at NodePort 8443
kubectl create -n kube-system -f https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/src/deploy/recommended/kubernetes-dashboard.yaml 
kubectl patch service kubernetes-dashboard --namespace=kube-system --type='json' --patch='[{"op": "replace", "path": "/spec/type","value":"NodePort"}]'
kubectl patch service kubernetes-dashboard --namespace=kube-system --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":8443}]'

# Helm Setup
helm init --wait
helm repo update

# Setup dashboard via chart like minikube on 30000
helm install stable/kubernetes-dashboard --name dash --set=service.type=NodePort --set=enableInsecureLogin=true --set=service.nodePort=30000 --set=service.externalPort=80 --namespace kube-system

clear 

echo "Kubernetes with Helm is ready."