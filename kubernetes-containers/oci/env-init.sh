#!/bin/sh

launch.sh

# Common curl switches
echo '-s' > ~/.curlrc

apt update
apt install tree --yes -qq
apt install wget --yes -qq

{ clear && echo 'Linux with Docker is ready.'; } 2> /dev/null
