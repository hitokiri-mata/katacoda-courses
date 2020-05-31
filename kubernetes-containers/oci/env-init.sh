#!/bin/sh

launch.sh

# Common curl switches
echo '-s' > ~/.curlrc

# apt update -qq
# apt install tree wget --yes -qq

{ clear && echo 'Linux with Docker is ready.'; } 2> /dev/null
