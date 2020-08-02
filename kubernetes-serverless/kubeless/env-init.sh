#!/bin/sh

launch.sh

# Helm Setup
# Currently the Kubeless chart does not support Helm v3 or K8s 1.18. It may never as project is dying. Use Knative instead.
helm init

# Setup dashboard on port 30000
helm install dash stable/kubernetes-dashboard \
--namespace kube-system \
--set=service.type=NodePort \
--set=enableInsecureLogin=true \
--set=service.nodePort=30000 \
--set=service.externalPort=80


source <(kubectl completion bash)
source <(helm completion bash)

{ clear && echo 'Kubernetes with Helm is ready.'; } 2> /dev/null
