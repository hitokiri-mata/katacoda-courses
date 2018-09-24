# Install OpenFaaS #

As you see, your Kubernetes cluster based on Minikube is started now or will be available shortly. Verify it's ready for your use:

`minikube version && minikube status`{{execute}}

## Preparation ##

First, create two namespaces, one for the OpenFaaS core services _openfaas_ and a second for the functions _openfaas-fn_.

`kubectl apply -f https://raw.githubusercontent.com/openfaas/faas-netes/master/namespaces.yml`{{execute}}

Then generate a Kubernetes secret for basic authentication for the gateway

`kubectl -n openfaas create secret generic basic-auth --from-literal=basic-auth-user=user --from-literal=basic-auth-password=$(cat user-password.txt)`{{execute}}

## Install OpenFaaS Operator ##

Helm is a package manager for Kubernetes and is initialized and ready.

`helm version`{{execute}}

A common Helm _chart_ is predefined for installing OpenFaaS. Normally, popular charts appear in the [curated Helm chart repository](https://github.com/kubernetes/charts) and there are plans to move OpenFaaS there. For now, this `repo add` command will allow Helm to find the OpenFaaS chart:

`helm repo add openfaas https://openfaas.github.io/faas-netes/`{{execute}}

Install the OpenFaaS operator

`helm upgrade openfaas --install openfaas/openfaas --namespace openfaas --set basic_auth=true --set functionNamespace=openfaas-fn --set operator.create=true --set rbac=false`{{execute}}

Watch the 5 deployments for OpenFaaS become _Available_. The _Available_ turns from 0 to 1 once each deployment has initialized.

`kubectl --namespace=openfaas get deployments -l "release=openfaas, app=openfaas"`{{execute}}

## OpenFaaS CLI ##

Finally, install the OpenFaaS command-line interface (CLI) tool.

`curl -sSL https://cli.openfaas.com | sh`{{execute}}

Verify it is installed

`faas-cli version`{{execute}}

At this point there is a OpenFaaS gateway providing access to both the portal and REST API to manage the functions and OpenFaaS. Most of the CLIs command from this point going forward require this gateway as a parameter. (It's an inconvenience when using the CLI, but perhaps there is a security concern why this cannot be a sticky setting.). To reduce the verbocity the gateway can be stored as an environment variable. If you were running Minikube locally, the command would be 

`GW = $(minikube service gateway-external  --url)`

But on Katacoda, because of the server virtualization the gateway is here

`GW=https://[[HOST_SUBDOMAIN]]-31112-[[KATACODA_HOST]].environments.katacoda.com/`{{execute}}

Once the gateway is obtained, the first action is to login

`faas-cli login --username user --password-stdin --gateway=$GW | cat user-password.txt`{{execute}}

## OpenFaaS Portal ##

You can also explore the OpenFaaS functions in the portal. On the right there is a tab called _OpenFaaS Portal_ or click on this link: https://[[HOST_SUBDOMAIN]]-31112-[[KATACODA_HOST]].environments.katacoda.com/

When prompted, use the same user name and password that was applied above in the secret creation (user/user). For visibility and understanding, leave this tab open for the subsequent steps.