#!/bin/sh

# Install kubeless CLI
curl -L http://github.com/kubeless/kubeless/releases/download/v1.0.0-alpha.8/kubeless_linux-amd64.zip -o kubeless.zip
unzip -Cj kubeless.zip "bundles/kubeless_linux-amd64/kubeless" -d /usr/local/bin

minikube config set WantUpdateNotification false
clear
minikube start
helm repo update
helm init --wait