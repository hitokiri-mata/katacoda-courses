# Preparations #

There are two things to do before installing OpenFaaS:

1\. Create and configure two namespaces, one for the OpenFaaS core services _openfaas_ and a second for the functions _openfaas-fn_.

`kubectl apply -f https://raw.githubusercontent.com/openfaas/faas-netes/master/namespaces.yml`{{execute}}

The created namespaces may be listed with:

`kubectl get namespaces`{{execute}}

To see the contents of the namespace creating YAML, run this

`curl https://raw.githubusercontent.com/openfaas/faas-netes/master/namespaces.yml`{{execute}}

2\. Generate a Kubernetes secret for basic authentication for the gateway

`PASSWORD=$(head -c 12 /dev/urandom | shasum | cut --delimiter=' ' --fields=1 | head -c 4)`{{execute}}

`kubectl -n openfaas create secret generic basic-auth --from-literal=basic-auth-user=user --from-literal=basic-auth-password=$PASSWORD`{{execute}}
