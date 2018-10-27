#!/bin/sh
minikube config set WantUpdateNotification false
clear
minikube start --cpus 4 --memory 8192
minikube addons enable registry
