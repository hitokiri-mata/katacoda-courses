#!/bin/sh

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

# Katacoda Cloud Provider is used when a LoadBalancer service is requested 
# by Kubernetes, Katacoda will respond with the IP of the master. This is 
# how Istio and other LoadBalancer based services can be deployed.
kubectl delete -f /opt/katacoda-cloud-provider.yaml

echo "done" >> /opt/.backgroundfinished