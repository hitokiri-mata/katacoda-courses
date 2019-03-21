#!/bin/sh

launch.sh

minikube config set WantUpdateNotification false
source <(minikube completion bash)
source <(kubectl completion bash)
source <(helm completion bash)
clear

echo 'Starting Kubernetes using Minikube...'
minikube start

minikube addons enable dashboard
