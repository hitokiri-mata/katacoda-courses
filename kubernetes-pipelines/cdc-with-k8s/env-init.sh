#!/bin/sh

launch.sh

# Common curl switches
echo '-s' >> ~/.curlrc

# Allow pygmentize for source highlighting of source files (YAML, Dockerfile, Java, etc)
docker pull -q whalebrew/pygmentize:2.6.1 &
echo 'function ccat() { docker run -it -v "$(pwd)":/workdir -w /workdir whalebrew/pygmentize $1; }' >> ~/.bashrc
source ~/.bashrc

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
