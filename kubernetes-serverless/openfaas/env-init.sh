#!/bin/sh

source <(kubectl completion bash)
source <(helm completion bash)

# Add Kubernetes dashboard at NodePort 30000
kubectl create -n kube-system -f https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/src/deploy/recommended/kubernetes-dashboard.yaml 
kubectl patch service kubernetes-dashboard --namespace=kube-system --type='json' --patch='[{"op": "replace", "path": "/spec/type","value":"NodePort"}]'
kubectl patch service kubernetes-dashboard --namespace=kube-system --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":8443}]'

# Helm Setup
helm init --wait
helm repo update

#TODO: Setup dashboard via chart like minikube
helm install stable/kubernetes-dashboard --name dash --set=service.type=NodePort --set=enableInsecureLogin=true --set=service.nodePort=30001 --set=service.externalPort=80 --namespace kube-system

clear 

echo "Kubernetes with Helm is ready."