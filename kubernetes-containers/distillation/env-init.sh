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

apt update
apt install tree --yes -qq

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH

#TODO - Drafting - perhaps instead of installing these build with podman using tekton pipeline
# Install buildah
# sudo apt update > /dev/null 2>&1
# sudo apt install -qq -y software-properties-common
# sudo add-apt-repository -y ppa:projectatomic/ppa
# sudo apt update > /dev/null 2>&1
# sudo apt -qq -y install buildah

# Install podman
# systemctl stop docker
# apt update -y -qq
# apt upgrade -y -qq
# apt install software-properties-common uidmap containernetworking-plugins -y -qq
# add-apt-repository -y ppa:projectatomic/ppa
# apt install podman -y -qq

{ clear && echo 'Kubernetes with Helm is ready.'; } 2> /dev/null
