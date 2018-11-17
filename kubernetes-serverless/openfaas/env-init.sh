#!/bin/sh
minikube config set WantUpdateNotification false

minikube completion bash
helm completion bash
kubectl completion bash

clear

minikube start --insecure-registry localhost:5000

minikube addons enable registry

# Using minikube's Docker daemon from our localhost
eval $(minikube docker-env)

helm repo update
helm init --wait

minikube status

echo "Kubernetes using Minikube is ready."