#!/bin/sh

launch.sh

minikube config set WantUpdateNotification false
source <(minikube completion bash)
source <(kubectl completion bash)
source <(helm completion bash)

minikube addons enable metrics-server
clear
