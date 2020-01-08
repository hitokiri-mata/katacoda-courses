#!/bin/sh

launch.sh

apt install tree
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH

# Helm Setup
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash 
helm repo add stable https://kubernetes-charts.storage.googleapis.com/

# Setup dashboard on port 30000
helm install dash stable/kubernetes-dashboard \
--namespace kube-system \
--set=service.type=NodePort \
--set=enableInsecureLogin=true \
--set=service.nodePort=30000 \
--set=service.externalPort=80

source <(kubectl completion bash)
source <(helm completion bash)

# TODO - would be nice to add instructional step to "alias docker=podman"
# Install buildah
# sudo apt-get update -qq
# sudo apt-get install -qq -y software-properties-common
# sudo add-apt-repository -y ppa:projectatomic/ppa
# sudo apt-get update -qq
# sudo apt-get -qq -y install buildah

# Install podman
# systemctl stop docker
# apt-get update -y -qq
# apt-get upgrade -y -qq
# apt-get install software-properties-common uidmap containernetworking-plugins -y -qq
# add-apt-repository -y ppa:projectatomic/ppa
#apt-get install podman -y -qq

{ clear && echo 'Kubernetes with Helm is ready.'; } 2> /dev/null
