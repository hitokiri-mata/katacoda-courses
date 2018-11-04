#!/bin/sh
minikube config set WantUpdateNotification false
clear
minikube start
helm init
helm repo update