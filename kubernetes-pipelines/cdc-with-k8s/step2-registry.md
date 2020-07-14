It's helpful to have a container registry during the build, push, and deploy phases. There is no need to shuttle private images over the internet. Instead, we keep all this pushing and pulling in a local registry.

## Install registry

<img align="right" src="./assets/pact-io.png" width="150">

There are many options for standing up a container registry. We prefer a pure Kubernetes solution and install a registry through the [stable Helm chart](https://github.com/helm/charts/tree/master/stable/docker-registry#docker-registry-helm-chart).

Add the repo where the chart is hosted.

`helm repo add stable https://kubernetes-charts.storage.googleapis.com`{{execute}}

Install the chart.

`helm install registry stable/docker-registry --namespace kube-system --set service.type=NodePort --set service.nodePort=31500`{{execute}}

## Verify registry

The registry is now available as a service. It can be listed.

`kubectl get service --namespace kube-system`{{execute}}

Assign an environment variable to the common registry location.

`export REGISTRY=[[HOST_SUBDOMAIN]]-31500-[[KATACODA_HOST]].environments.katacoda.com`{{execute}}

It will be a few moments before the registry deployment reports it's _Available_.

`kubectl get deployments registry-docker-registry --namespace kube-system`{{execute}}

Once the registry is serving, inspect the contents of the empty registry.

`curl $REGISTRY/v2/_catalog`{{execute}}

When it's running and healthy, you will see an empty list.

`{"repositories":[]}`

Docker tags require the address of the registry to be in the tag. If we push and pull from the registry, the registry name tag must be the same when we are on the client or within Kubernetes. Within your cluster, the registry is available at localhost:5000. Use a port-forwarding command to make this client's localhost:5000 to be the same registry.

`kubectl port-forward -n kube-system service/registry-docker-registry 5000:5000 &`{{execute}}

This port forwarding will run in the background for the remainder of this scenario. If you do not see the Linux $ prompt, just hit enter.

Now you can access the registry via localhost.

`curl http://localhost:5000/v2/_catalog`{{execute}}

Later, you will see docker push commands and YAML container references both using http://localhost:5000.
