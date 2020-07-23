#!/bin/sh

launch.sh

# Syntax highlighting for YAML
snap install yq  --no-wait
function caty() {
  cat "$@" | yq -C read -
}

# Common curl switches
echo '-s' >> ~/.curlrc

apt update > /dev/null 2>&1
apt install tree wget --yes -qq

{ clear && echo 'Linux with Docker is ready.'; } 2> /dev/null
