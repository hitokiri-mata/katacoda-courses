# First Python Function #

OpenFaaS functions progress through distinct phases before they can run: Create, Build, Push and Deploy. The later Build, Push and Deploy can be converged into a simple "up" command.

## Create ##

First create the opinionated files for the new function.

`faas-cli new fibonacci --lang python3`{{execute}}

Copy the pre-written example fibonacci code into the handler code.

`cp fibonacci.py fibonacci/handler.py`{{execute}}

## Up to Build, Push and Deploy ##

`faas-cli up -f fibonacci.yml`{{execute}}

## Call ##

`echo world | faas-cli invoke fibonacci`{{execute}}
