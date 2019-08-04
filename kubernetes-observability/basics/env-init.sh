#!/bin/sh

source <(helm completion bash)
minikube addons enable dashboard

clear