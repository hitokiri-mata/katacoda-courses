#!/bin/sh
minikube config set WantUpdateNotification false
clear
minikube start --memory 8192
helm repo update
helm init --wait
