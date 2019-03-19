Nuclio requires a container registry during the build, push and deploy phases. It defaults to using Docker Hub, but there is no need to shuttle private images over the internet. Instead we keep all this pushing and pulling in a local registry.

There are many options for standing up a container registry. We prefer a pure Kubernetes solution and install a registry through the [stable Helm chart](https://github.com/helm/charts/tree/master/stable/docker-registry#docker-registry-helm-chart).

`helm install stable/docker-registry --name registry --namespace kube-system --set service.type=NodePort --set service.nodePort=31500`{{execute}}

The registry is now available as a service. It can be listed.

`kubectl get service --namespace kube-system`{{execute}}

Assign an environment variable to the common registry location.

`export REGISTRY=[[HOST_SUBDOMAIN]]-31500-[[KATACODA_HOST]].environments.katacoda.com`{{execute}}

It will be a few moments before the registry deployment reports it's _Available_.

`kubectl get deployments registry-docker-registry --namespace kube-system`{{execute}}

Once the registry is serving, inspect the contents of the empty registry.

`curl $REGISTRY/v2/_catalog`{{execute}}

## Create registry secret ##

Create a secret that stores your registry credentials. Replace the <...> placeholders in the following commands with your username, password, and URL:

Note: If you want to use Docker Hub, the URL is registry.hub.docker.com.

Create the secret by running this and silently entering your password.

`read -s mypassword`{{execute}}

To confirm your password echo it.

`echo $mypassword`{{execute}}

kubectl create secret docker-registry nuclio-registry-credentials --namespace nuclio \
    --docker-username $USER \
    --docker-password $mypassword \
    --docker-server <registry name> \
    --docker-email ignored@nuclio.io

It's good practice to remove these secrets.

`unset mypassword`{{execute}}