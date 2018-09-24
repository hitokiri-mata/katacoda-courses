# Build, Deploy and Call a Python Function #

## Build ##

`faas-cli new --lang python fibonacci`{{execute}}

There is already a coded solution so this will copy the solution into this new OpenFaaS python project.

`cp fibonacci.py fibonacci/handler.py`{{execute}}

`eval $(minikube docker-env)`{{execute}}

`docker login`{{execute}}

`faas-cli build -f hello.yaml`{{execute}}

`faas-cli push -f hello.yaml`{{execute}}

## Deploy ##

`faas-cli deploy -f hello.yml --gateway $(minikube service gateway-external  --url)`{{execute}}

## Call ##

`echo world | faas-cli invoke hello --gateway $(minikube service gateway-external  --url)`{{execute}}


``{{execute}}


``{{execute}}



