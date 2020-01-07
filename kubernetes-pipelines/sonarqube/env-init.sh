#!/bin/sh

launch.sh

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

{ clear && echo 'Kubernetes with Helm is ready.'; } 2> /dev/null

# Workaround: Katacoda base image needs fixing
#JAVA_HOME is set to JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre/bin, should be:
# export JAVA_HOME=JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre

# Need Java for Gradle build
# TODO - are these needed? Abovev should have  fixed it
# sudo apt-get update --fix-missing
# apt install -y openjdk-8-jdk-headless --fix
# export JAVA_HOME=/usr/lib/jvm/default-java
