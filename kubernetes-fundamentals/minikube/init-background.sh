#!/bin/bash

launch.sh

# Log script activity (https://serverfault.com/a/103569)
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>/var/log/init-background.log 2>&1
set -x	

# Common curl switches (however, use `lynx url --dump` when you can)
echo '-s' >> ~/.curlrc

source <(helm completion bash)
source <(minikube completion bash)

minikube addons enable metrics-server
minikube addons enable dashboard

echo "done" >> /opt/.backgroundfinished