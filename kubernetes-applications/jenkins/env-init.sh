#!/bin/sh
minikube config set WantUpdateNotification false
minikube config set bootstrapper kubeadm
clear
minikube start --memory 8192
helm repo update
helm init --wait
