#!/bin/sh
minikube config set WantUpdateNotification false
minikube config set bootstrapper kubeadm
clear
minikube start
helm repo update
helm init --wait

# TODO:  ? 1. Start Minikube with  `./start.sh`.
