#!/bin/sh

source <(helm completion bash)

minikube addons enable metrics-server
clear
