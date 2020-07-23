#!/bin/sh

launch.sh

# Common curl switches
echo '-s' >> ~/.curlrc


# Enable metrics
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install metrics-server bitnami/metrics-server --version=4.2.1 --namespace kube-system 

# Setup dashboard on port 30000
helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
helm install dash kubernetes-dashboard/kubernetes-dashboard \
--version=2.3.0 \
--namespace kube-system \
--set=image.tag=v2.0.3 \
--set=service.type=NodePort \
--set=enableInsecureLogin=true \
--set=service.nodePort=30000 \
--set=service.externalPort=80

{ clear && echo 'Kubernetes with Helm is ready.'; } 2> /dev/null