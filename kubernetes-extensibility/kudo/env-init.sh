#!/bin/sh

launch.sh

source <(kubectl completion bash)
source <(helm completion bash)

mkdir dev
cd dev

{ clear && echo 'Kubernetes with Helm is ready.'; } 2> /dev/null