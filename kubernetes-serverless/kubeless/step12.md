# Cleanup #

## Remove Functions ##

Use the Kubeless CLI tool to list and remove the functions introduced in these scenarios:

`kubeless function list`{{execute}}

`kubeless function delete fibonacci`{{execute}}
`kubeless function delete hello`{{execute}}
`kubeless function delete ruby-example`{{execute}}
`kubeless function delete get`{{execute}}

After delete, the associated Deployments, Pods, and ConfigMaps will be removed from the Kubernetes _default_ namespace.

## Remove Kubeless ##

The Helm installation of Kubeless can be seen in this list:

`helm list`{{execute}}

Kubeless can be removed from the cluster with this single command:

`helm delete my-kubeless --purge`{{execute}}

This will also remove the _kubeless_ namespace. Verify the remaining namespaces with:

`kubectl get namespaces`{{execute}}
