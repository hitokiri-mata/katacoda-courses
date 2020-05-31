#!/bin/sh

launch.sh

# Common curl switches
echo '-s' > ~/.curlrc

apt update
apt install tree --yes

{ clear && echo 'Linux with Docker is ready.'; } 2> /dev/null
