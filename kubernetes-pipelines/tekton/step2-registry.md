There are many workflows around Kubernetes that need access to one more container registries. While public registries are commonly referenced there is privacy concerns and no need to shuttle private images over public networks. Instead, private registries keep all this pushing and pulling in a local registry.

There are many options for standing up a container registry. We prefer a pure Kubernetes solution and install a registry through the [stable Helm chart](https://github.com/helm/charts/tree/master/stable/docker-registry#docker-registry-helm-chart).

## Install the Registry

`helm install private stable/docker-registry --namespace kube-system`{{execute}}

## Install the Registry Proxies

`helm repo add incubator http://storage.googleapis.com/kubernetes-charts-incubator`{{execute}}

`helm install registry-proxy incubator/kube-registry-proxy \
--set registry.host=private-docker-registry.kube-system \
--set registry.port=5000 \
--set hostPort=5000 \
--namespace kube-system`{{execute}}

The registry is now available as a service.

## Install Registry UI

It's always helpful to have a decent web interface in front of your registry. There are a few open solutions out there that all run as containers.

This particular one [joxit/docker-registry-ui](https://github.com/Joxit/docker-registry-ui) is solid and provides a clean interface. Merci beaucoup, [Jones Magloire](https://joxit.dev/).

`kubectl create -f registry-ui.yaml`{{execute}}

In a moment the new web interface will be available. Open the [registry web interface](
https://[[HOST_SUBDOMAIN]]-31000-[[KATACODA_HOST]].environments.katacoda.com/) and observe it hosts the single _dockerfilelint_ container image.
