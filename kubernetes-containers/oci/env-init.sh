#!/bin/sh

launch.sh

# Common curl switches
echo '-s' >> ~/.curlrc

# Allow pygmentize for source highlighting of source files (YAML, Dockerfile, Java, etc)
docker pull -q whalebrew/pygmentize &
echo 'function ccat() { docker run -it -v "$(pwd)":/workdir -w /workdir whalebrew/pygmentize $1; }' >> ~/.bashrc
source ~/.bashrcapt update > /dev/null 2>&1
apt install tree wget --yes -qq

{ clear && echo 'Linux with Docker is ready.'; } 2> /dev/null
