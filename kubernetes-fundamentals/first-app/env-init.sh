#!/bin/sh

source <(helm completion bash)
clear

echo 'Starting Kubernetes using Minikube...'
minikube start

minikube addons enable metrics-server

# Dashboard for Minikube on port 30000
minikube addons enable dashboard
kubectl apply -f /opt/kubernetes-dashboard.yaml