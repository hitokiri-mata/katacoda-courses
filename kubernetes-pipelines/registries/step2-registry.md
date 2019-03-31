There are many processes around Kubernetes that requires access to one more container registries. While public registries are often referenced there is often privacy concerns and no need to shuttle private images over the internet. Instead, private registries keep all this pushing and pulling in a local registry.

There are many options for standing up a container registry. We prefer a pure Kubernetes solution and install a registry through the [stable Helm chart](https://github.com/helm/charts/tree/master/stable/docker-registry#docker-registry-helm-chart).

`helm install stable/docker-registry --name private --namespace kube-system \
--set image.tag=2.7.1 \
--set service.type=NodePort \
--set service.nodePort=31500`{{execute}}

The registry is now available as a service. It can be listed.

`kubectl get service --namespace kube-system`{{execute}}

Assign an environment variable to the common registry location.

`export REGISTRY=[[HOST_SUBDOMAIN]]-31500-[[KATACODA_HOST]].environments.katacoda.com`{{execute}}

It will be a few moments before the registry deployment reports it's _Available_ with a _1_.

`kubectl get deployments private-docker-registry --namespace kube-system`{{execute}}

Once the registry is serving, inspect the contents of the empty registry.

`curl $REGISTRY/v2/_catalog`{{execute}}
