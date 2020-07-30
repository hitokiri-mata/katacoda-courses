#!/bin/bash

launch.sh

# Log script activity (https://serverfault.com/a/103569)
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>/var/log/init-background.log 2>&1
set -x	

# Common curl switches (however, use `lynx url --dump` when you can)
echo '-s' >> ~/.curlrc

# Allow pygmentize for source highlighting of source files (YAML, Dockerfile, Java, etc)
docker pull -q whalebrew/pygmentize:2.6.1 &
echo 'function ccat() { docker run -it -v "$(pwd)":/workdir -w /workdir whalebrew/pygmentize $@; }' >> ~/.bashrc
source ~/.bashrcapt update > /dev/null 2>&1

{ clear && echo 'Linux with Docker is ready.'; } 2> /dev/null
