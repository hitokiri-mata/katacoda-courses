#!/bin/sh
minikube config set WantUpdateNotification false
minikube config set bootstrapper kubeadm
clear
minikube start
