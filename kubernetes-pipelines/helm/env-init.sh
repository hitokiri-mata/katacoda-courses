#!/bin/sh

launch.sh

apt update
apt install tree --yes -qq

source <(kubectl completion bash)

{ clear && echo 'Kubernetes is ready.'; } 2> /dev/null