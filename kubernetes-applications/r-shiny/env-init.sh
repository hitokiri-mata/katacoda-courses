#!/bin/sh

{
  sleep 1; launch.sh
  source <(minikube completion bash);
  source <(kubectl completion bash);
  source <(helm completion bash);
  minikube addons enable dashboard;
  kubectl create -f /opt/kubernetes-dashboard.yaml;
  echo "Your Kubernetes cluster, based on Minikube, is ready.";
} 2> /dev/null
