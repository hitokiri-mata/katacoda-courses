# OpenFaaS CLI #

A common way to interact with OpenFaaS is from the command line. Install the OpenFaaS command-line interface (CLI) tool.

`curl -sSL https://cli.openfaas.com | sh`{{execute}}

At this point there is a OpenFaaS gateway providing access to both the portal and REST API to manage the functions and OpenFaaS. Most of the CLI commands from this point going forward require this gateway as a parameter. To reduce the verbosity the gateway can be stored as an environment variable. If you were running Minikube locally, the command would be

`export OPENFAAS_URL=$(minikube service gateway-external --namespace openfaas --url)`

But because of Katacoda's server virtualization the gateway is here

`export OPENFAAS_URL=https://[[HOST_SUBDOMAIN]]-31112-[[KATACODA_HOST]].environments.katacoda.com/`{{execute}}

With the gateway access, the first action is to login. We will use the same password that was previously generated.

`faas-cli login --username user --password="$PASSWORD"`{{execute}}
