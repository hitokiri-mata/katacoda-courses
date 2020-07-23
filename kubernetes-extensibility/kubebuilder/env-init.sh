#!/bin/sh

launch.sh

# Common curl switches
echo '-s' >> ~/.curlrc


# Install Kustomize (TODO - needed?)
curl -s "https://raw.githubusercontent.com/\
kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash
mv kustomize /usr/local/bin/

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

# Ensure file browser and editor start in clean directory
cd /opt/go/src

{ clear && echo 'Kubernetes with Helm is ready.'; } 2> /dev/null