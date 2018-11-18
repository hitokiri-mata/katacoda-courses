# Preparations #

There are a few things to prepare before installing OpenFaaS:

## Namespaces ##

1\. Create and configure two namespaces, one for the OpenFaaS core services _openfaas_ and a second for the functions _openfaas-fn_.

`kubectl apply -f https://raw.githubusercontent.com/openfaas/faas-netes/master/namespaces.yml`{{execute}}

The created namespaces may be listed.

`kubectl get namespaces`{{execute}}

If you are curious, scan the contents of the namespace creating YAML. It does more than just creating the namespaces.

`curl https://raw.githubusercontent.com/openfaas/faas-netes/master/namespaces.yml`{{execute}}.

## OpenFaaS Access Secret ##

2\. Generate and submit a Kubernetes secret for basic authentication for the gateway. The secret is named _basic-auth_ and OpenFaaS will use that key when it prompts you for access.

`PASSWORD=$(head -c 12 /dev/urandom | shasum | cut --delimiter=' ' --fields=1 | head -c 4)`{{execute}}

The random password is shortened to just 4 characters for these demonstration purposes. Normally `head -c 4` would be omitted.

`kubectl -n openfaas create secret generic basic-auth --from-literal=basic-auth-user=user --from-literal=basic-auth-password=$PASSWORD`{{execute}}

## Container Registry ##

3\. There is a private Docker registry running on Kubernetes. Minikube has a registry addon and its has been exposed on port 31500. OpenFaaS requires a container registry to push built images and pull images that contain functions. OpenFaaS default to using Docker Hub, but there is no need to shuttle private images over the internet. Instead we keep all this pushing and pulling locally.

`kubectl create secret docker-registry openfaas-repo --docker-username="admin" --docker-password="admin" --docker-server=$(minikube ip):31500 --namespace openfaas-fn`{{execute}}

Inform the service account there is a new registry called _openfaas-repo_.

`kubectl patch serviceaccount default --namespace openfaas-fn --patch '{"imagePullSecrets": [{"name": "openfaas-repo"}]}'`{{execute}}