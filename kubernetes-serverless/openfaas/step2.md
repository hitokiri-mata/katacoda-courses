# Build, Deploy and Call a Python Function #

## Build ##

`faas-cli new --lang python fibonacci --gateway $GW --prefix localhost:5000`{{execute}}

There is already a coded solution so this will copy the solution into this new OpenFaaS python project.

`cp fibonacci.py fibonacci/handler.py`{{execute}}

`eval $(minikube docker-env)`{{execute}}

`docker login`{{execute}}

`faas-cli build -f fibonacci.yml`{{execute}}

`faas-cli push -f fibonacci.yml`{{execute}}

## Deploy ##

`faas-cli deploy -f fibonacci.yml --gateway $GW`{{execute}}

## Call ##

`echo world | faas-cli invoke fibonacci --gateway $GW`{{execute}}
