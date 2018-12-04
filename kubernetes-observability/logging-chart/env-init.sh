#!/bin/sh

# TODO: There is a known issue with Katacoda when this is applied. Waiting to move to new version of Minikube.
# minikube config set bootstrapper kubeadm
source <(kubectl completion bash)
source <(helm completion bash)

clear
