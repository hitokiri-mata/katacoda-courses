#!/bin/sh

launch.sh

# Common curl switches
echo '-s' > ~/.curlrc

apt-get update
apt-get install wget
apt install tree

{ clear && echo 'Linux with Docker is ready.'; } 2> /dev/null
