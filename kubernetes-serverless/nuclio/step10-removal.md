All control plane components can be cleaned up with helm:

`helm delete nuclio --purge`{{execute}}

Follow this by the following to remove all other associated objects:

`kubectl delete namespace nuclio`{{execute}}

In some cases your additional functions may need to be either deleted before deleting the chart with faas-cli or manually deleted using kubectl delete.
