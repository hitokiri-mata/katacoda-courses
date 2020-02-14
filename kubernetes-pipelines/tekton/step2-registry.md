There are many workflows around Kubernetes that need access to one more container registries. While public registries are commonly referenced there is privacy concerns and no need to shuttle private images over public networks. Instead, private registries keep all this pushing and pulling in a local registry.

There are many options for standing up a container registry. We prefer a pure Kubernetes solution and install a registry through the [stable Helm chart](https://github.com/helm/charts/tree/master/stable/docker-registry#docker-registry-helm-chart).

## Setup a Secret for Pushing and Pulling

When Kubernetes pulls an image a secret needs to be associated with the image reference. The secret name and password needs to be created and provided when the registry is deployed and as a Kubernetes Secret. The password will just be a random sequence.

`REGISTRY_USER="Grace" && REGISTRY_PASSWORD=$(openssl rand -base64 40)`{{execute}}

Generate a standard [htpasswd](https://httpd.apache.org/docs/2.4/programs/htpasswd.html) using this name and password.

HTPASSWD=`docker run --entrypoint htpasswd registry:2 -Bbn $REGISTRY_USER $REGISTRY_PASSWORD`

## Install the Registry

`helm install private stable/docker-registry --namespace kube-system \
--set image.tag=2.7.1 \
--set htpasswd=$HTPASSWD \
--set service.type=NodePort \
--set service.nodePort=31500`{{execute}}

Create a Kubernetes Secret for image registry pulls based on the user `Grace` with the password.

`kubectl create secret docker-registry regcred \
--docker-server=http://private-docker-registry:5000 \
--docker-username=$REGISTRY_USER \
--docker-password=$REGISTRY_PASSWORD \
--docker-email=jj@dijure.com`{{execute}}

The registry is now available as a service. It can be listed.

`kubectl get service --namespace kube-system`{{execute}}

The Docker tag, push and pull commands must all have the same host name for the image. Docker also requires SSL access, so it's necessary to consistently refer to the registry from the command line and from within the cluster. In this scenario case we can simply use 127.0.0.0. Use port-forward to expose the registry.

`kubectl port-forward --namespace kube-system \
$(kubectl get po -n kube-system | grep private-docker-registry | \
awk '{print $1;}') 5000:5000 &`{{execute}}

After the port-forward command press _enter_ to restore the command prompt. Assign an environment variable to the common registry location.

`export REGISTRY=127.0.0.1:31500`{{execute}}

It will be a few moments before the registry deployment reports it's _Available_ with a _1_.

`kubectl get deployments private-docker-registry --namespace kube-system`{{execute}}

Once the registry is serving, inspect the contents of the empty registry.

`curl $REGISTRY/v2/_catalog`{{execute}}
