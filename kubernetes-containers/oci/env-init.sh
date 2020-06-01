#!/bin/sh

launch.sh

# Common curl switches
echo '-s' > ~/.curlrc

# Allow pygmentize for source highlighting
docker pull whalebrew/pygmentize
echo 'function ccat() { docker run -it -v "$(pwd)":/workdir -w /workdir whalebrew/pygmentize $1; }' >> ~/.bashrc
source ~/.bashrc

apt update -qq
apt install tree wget --yes -qq

{ clear && echo 'Linux with Docker is ready.'; } 2> /dev/null
