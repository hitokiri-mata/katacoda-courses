#!/bin/sh

launch.sh

# Common curl switches
echo '-s' >> ~/.curlrc

# Allow pygmentize for source highlighting of source files (YAML, Dockerfile, Java, etc)
docker pull -q whalebrew/pygmentize &
echo 'function ccat() { docker run -it -v "$(pwd)":/workdir -w /workdir whalebrew/pygmentize $1; }' >> ~/.bashrc
source ~/.bashrc
source <(kubectl completion bash)
source <(helm completion bash)

mkdir dev
cd dev

# Insure tree is available, not all Katacoda instance have it consistently available.
apt update > /dev/null 2>&1
apt install tree --yes -qq

{ clear && echo 'Kubernetes is ready.'; } 2> /dev/null