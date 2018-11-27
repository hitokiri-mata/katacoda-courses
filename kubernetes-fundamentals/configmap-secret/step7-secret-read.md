# Read Secret #

Just as there are three ways to get ConfigMap data into a Pod, the same three techniques are available for secrets. Here is an example on just a Pod definitions can secrets to environment properties.

There is a secret in the cluster called _db-creds_.

`kubectl get secrets`{{execute}}

The secret has two values _username_ and _password_.

`kubectl get secret db-creds -o yaml`{{execute}}

Start a container in a Pod that maps these secrets to the environment parameters.

`cat kuard.yaml`{{execute}}

Launch the Kuard application and associate a service with its Pod.

`kubectl create -f kuard.yaml`{{execute}}

`kubectl create -f kuard-service.yaml`{{execute}}

The kuard application portal can be seen at this link

https://[[HOST_SUBDOMAIN]]-31001-[[KATACODA_HOST]].environments.katacoda.com/

Navigate to the Server Env page and notice at the bottom are the two secrets.

This exposes the basics of secrets. There is a bit more to secrets than just this example which is [documented here](https://kubernetes.io/docs/concepts/configuration/secret/).