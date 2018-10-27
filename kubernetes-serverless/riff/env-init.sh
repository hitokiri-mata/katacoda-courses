#!/bin/sh
minikube config set WantUpdateNotification false
clear
minikube start
minikube addons enable registry
