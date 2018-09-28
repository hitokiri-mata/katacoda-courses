#!/bin/sh
minikube config set WantUpdateNotification false
clear
minikube start
helm repo update
helm init --wait
