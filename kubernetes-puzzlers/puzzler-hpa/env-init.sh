#!/bin/sh

launch.sh

# Syntax highlighting for YAML
snap install yq  --no-wait
function caty() {
  cat "$@" | yq -C read -
}

# Common curl switches
echo '-s' >> ~/.curlrc


# Setup dashboard on port 30000
helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
helm install dash kubernetes-dashboard/kubernetes-dashboard \
--namespace kube-system \
--set=service.type=NodePort \
--set=enableInsecureLogin=true \
--set=service.nodePort=30000 \
--set=service.externalPort=80

source <(kubectl completion bash)
source <(helm completion bash)

{ clear && echo 'Kubernetes with Helm is ready.'; } 2> /dev/null
