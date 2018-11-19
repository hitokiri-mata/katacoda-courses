# Removing OpenFaaS #

There really is no need to cleanup with Katacoda but if your were running this tutorial with Minikube or another type of Kubernetes cluster it would be good to clean up this work.

Since OpenFaaS was installed with the Helm package manager, it can be deleted by referencing the installation name.

`helm delete openfaas --purge`{{execute}}

Also remove the namespaces that were created before the installation:

`kubectl delete namespace/openfaas`{{execute}}

`kubectl delete namespace/openfaas-fn`{{execute}}

Sometimes you may just want to delete the functions.

`faas-cli remove fibonacci`{{execute}}

In some cases your functions may need to be either deleted before deleting the chart with faas-cli or manually deleted using kubectl delete.
