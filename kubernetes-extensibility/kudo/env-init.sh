#!/bin/sh

launch.sh

source <(kubectl completion bash)
source <(helm completion bash)

mkdir dev
cd dev

# Insure tree is available, not all Katacoda instance have it consistently available.
apt update > /dev/null 2>&1
apt install tree --yes -qq

{ clear && echo 'Kubernetes is ready.'; } 2> /dev/null