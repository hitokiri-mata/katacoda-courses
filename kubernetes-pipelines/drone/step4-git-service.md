Configure a version control provider

`helm repo add incubator https://kubernetes-charts-incubator.storage.googleapis.com/`{{execute}}

`helm install incubator/gogs --name gogs --namespace gogs --set service.httpNodePort`{{execute}}
