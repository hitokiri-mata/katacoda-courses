#!/bin/sh

launch.sh

# Helm setup
HELM_VERSION=v3.2.4
curl -fsSL https://get.helm.sh/helm-$HELM_VERSION-linux-amd64.tar.gz | tar -zxvf - -C /usr/local/bin/ linux-amd64/helm --strip=1
helm repo add stable https://kubernetes-charts.storage.googleapis.com/

# Setup dashboard on port 30000
helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
helm install dash kubernetes-dashboard/kubernetes-dashboard \
--namespace kube-system \
--set=image.tag=v2.0.3 \
--set=service.type=NodePort \
--set=enableInsecureLogin=true \
--set=service.nodePort=30000 \
--set=service.externalPort=80

source <(kubectl completion bash)
source <(helm completion bash)

# Enable metrics
helm install metrics-server stable/metrics-server --namespace kube-system 

apt update > /dev/null 2>&1
apt install tree --yes -qq

{ clear && echo 'Kubernetes with Helm is ready.'; } 2> /dev/null
