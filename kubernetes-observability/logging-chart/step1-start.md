## Start Kubernetes ##

`launch.sh`{{execute}}

Ensure Kubernetes is running and ready to accept your upcoming declarations.

`kubectl cluster-info`{{execute}}

## Start Helm ##

Initialize Helm, a package manager for Kubernetes.

`helm init && helm repo update`{{execute}}

## Dashboard ##

`kubectl create -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml`{{execute}}

Setup a proxy to enable access to the dashboard.

`kubectl proxy &`{{execute}}

Once it's running, access the [Kubernetes Dashboard](https://[[HOST_SUBDOMAIN]]-8001-[[KATACODA_HOST]].environments.katacoda.com/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/).
