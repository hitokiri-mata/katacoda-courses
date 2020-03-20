#!/bin/sh

launch.sh

# Helm Setup (v3.1.2)
FOLDER=helmer
mkdir $FOLDER && pushd $FOLDER
curl -fsSL -o helm.gz https://get.helm.sh/helm-v3.1.2-linux-amd64.tar.gz
tar -zxvf helm.gz
mv ./linux-amd64/helm /usr/local/bin
popd && rm -rf $FOLDER
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

# Workaround: Katacoda base image needs fixing
# JAVA_HOME is set to JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre/bin, should be:
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre

{ clear && echo 'Kubernetes with Helm is ready.'; } 2> /dev/null

