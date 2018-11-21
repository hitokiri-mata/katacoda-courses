#!/bin/sh
minikube config set WantUpdateNotification false
source <(minikube completion bash)
source <(kubectl completion bash)
source <(helm completion bash)
clear

# TODO: There is a known issue with Katacoda when this is applied. 
# Use `minikube start --bootstrapper kubeadm` instead
# minikube config set bootstrapper kubeadm
