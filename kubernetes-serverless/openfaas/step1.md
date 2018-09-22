# Install OpenFaaS #

As you see, your Kubernetes cluster based on Minikube is started now or will be available shortly. Verify it's ready for your use:

`minikube version && minikube status`{{execute}}

## Kubernetes Setup ##

First, we will create two namespaces, one for the OpenFaaS core services _openfaas_ and a second for the functions _openfaas-fn_.

`kubectl apply -f https://raw.githubusercontent.com/openfaas/faas-netes/master/namespaces.yml`{{execute}}

Then generate a Kubernetes secret for basic authentication for the gateway:

kubectl -n openfaas create secret generic basic-auth \
--from-literal=basic-auth-user=admin \
--from-literal=basic-auth-password="$PASSWORD"

## Helm Installs OpenFaaS Operator ##

Helm is a package manager for Kubernetes and is initialized and ready.

`helm version`{{execute}}

A common Helm _chart_ is predefined for installing OpenFaaS. This `repo add` command will allow Helm to find the OpenFaaS chart:

`helm repo add openfaas https://openfaas.github.io/faas-netes/`{{execute}}

Install the OpenFaaS operator

`helm upgrade openfaas --install openfaas/openfaas --namespace openfaas --set basic_auth=true --set functionNamespace=openfaas-fn --set operator.create=true`{{execute}}
