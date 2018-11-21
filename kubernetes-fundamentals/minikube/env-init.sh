#!/bin/sh
minikube config set WantUpdateNotification false
clear

# TODO: There is a known issue with Katacoda when this is applied. 
# Use `minikube start --bootstrapper kubeadm` instead
# minikube config set bootstrapper kubeadm
