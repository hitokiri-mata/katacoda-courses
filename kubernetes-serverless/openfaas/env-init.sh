#!/bin/sh

source <(kubectl completion bash)
source <(helm completion bash)

# Add Kubernetes dashboard at NodePort 30000
kubectl create -n kube-system -f https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/src/deploy/recommended/kubernetes-dashboard.yaml 
kubectl patch service kubernetes-dashboard --namespace=kube-system --type='json' --patch='[{"op": "replace", "path": "/spec/type","value":"NodePort"}]'
kubectl patch service kubernetes-dashboard --namespace=kube-system --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":30000}]'

# Helm Setup
helm init --wait
helm repo update

clear 

echo "Kubernetes with Helm is ready."