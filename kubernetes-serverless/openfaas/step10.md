# Removing OpenFaaS #

Remove the functions

`faas-cli remove fibonacci --gateway $GW`{{external}}

All control plane components can be cleaned up with helm:

`helm delete --purge openfaas`{{execute}}

Follow this by the following to remove all other associated objects:

`kubectl delete namespace/openfaas`{{execute}}

`kubectl delete namespace/openfaas-fn`{{execute}}

In some cases your additional functions may need to be either deleted before deleting the chart with faas-cli or manually deleted using kubectl delete.
