There are many workflows around Kubernetes that need access to one or more container registries. While public registries are commonly referenced there are privacy concerns and no needs to shuttle private images over public networks. Instead, private registries keep all this pushing and pulling in a local registry.

There are many options for standing up a container registry. We prefer a pure Kubernetes solution and install a registry through the [stable Helm chart for Docker Registry](https://github.com/helm/charts/tree/master/stable/docker-registry#docker-registry-helm-chart).

## Install the Registry

`helm install private stable/docker-registry --namespace kube-system`{{execute}}

## Install Registry Proxies as Node Daemons

In the subsequent steps the pipeline will build containers and deploy them to this registry. The Docker Engine running Kubernetes clusters has tight security rules around pulling images from registries. Especially registries that are deemed an “insecure". Docker requires pulls to be SSL and with authentication. However, often times you are just wanting to use the private registry just within the cluster. The Docker engine will pull from a "localhost" registry without triggering its security precautions. We run a "kube-registry-proxy" on each node in the cluster,
exposing a port onto the node (via a hostPort), which Docker accepts as acceptable, since it is accessed by localhost.

`helm repo add incubator http://storage.googleapis.com/kubernetes-charts-incubator`{{execute}}

`helm install registry-proxy incubator/kube-registry-proxy \
--set registry.host=private-docker-registry.kube-system \
--set registry.port=5000 \
--set hostPort=5000 \
--namespace kube-system`{{execute}}

This proxy is deployed as a [DaemonSet](https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/) on every Node in your cluster. Internal to all the container engines in the cluster, the registry is now available as a service for pushing and pulling container images. You can pull images from the registry at http://localhost:5000 and the proxies resolves the requests to https://private-docker-registry.kube-system:5000.

## Install Registry UI

It's always helpful to have a decent web interface in front of your registry. There are a few open solutions out there that all run as containers.

This particular one [joxit/docker-registry-ui](https://github.com/Joxit/docker-registry-ui) is solid and provides a clean interface. Merci beaucoup, [Jones Magloire](https://joxit.dev/).

`kubectl create -f registry-ui.yaml`{{execute}}

In a moment the new web interface will be available. Open the [registry web interface](
https://[[HOST_SUBDOMAIN]]-31000-[[KATACODA_HOST]].environments.katacoda.com/) and observe it hosts the single _dockerfilelint_ container image.
