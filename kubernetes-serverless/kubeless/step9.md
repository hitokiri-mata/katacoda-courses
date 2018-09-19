# Remove Functions and Kubeless #

## Remove Functions ##

Use the Kubeless CLI tool to list and remove the functions:

`kubeless ls`{{execute}}

`kubeless delete name1-todo`{{execute}}
`kubeless delete name1-todo`{{execute}}

After delete, the associated Deployments, Pods and ConfigMaps will be removed from the Kubernetes _default_ namespace.

## Remove Kubeless ##

The Helm installation of Kubeless can be seen in this list:

`helm ls`{{execute}}

Kubeless can be removed from the cluster with this one command:

`helm delete my-kubeless`{{execute}}

This will also remove the _kubeless_ namespace. Verify the remaining namespaces with:

`kubectl get namespaces`{{execute}}
