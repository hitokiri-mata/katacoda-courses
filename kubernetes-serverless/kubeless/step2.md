# Kubeless Tools #

## Install Kubeless CLI tool ##

Kubeless has a command line tool (CLI) named appropriately `kubeless`. Use this tool to manage your functions on _Kubeless_. Let's get the latest Kubeless command line interface (CLI) binary for this Linux.

`curl -L http://github.com/kubeless/kubeless/releases/download/v1.0.0-alpha.8/kubeless_linux-amd64.zip -o kubeless.zip`{{execute}}

`unzip -Cj kubeless.zip "bundles/kubeless_linux-amd64/kubeless" -d /usr/local/bin`{{execute}}

This tool version will match the controller installed in the next step. Verify this CLI is working by inspecting its current version

`kubeless --help && kubeless version`{{execute}}

## Kubeless Dashboard ##

There is also a user interface as an alternative way to manage _Kubeless_ and your functions. 

The Kubeless UI: https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/
