# Observability #

A good system will have features in place to observe its status, health and activity. Prometheus is a de facto solution for monitoring the metrics of a Kubernetes clusters and its applications. Prometheus is a time series database and with it, various metrics of the functions can be stored over time and observed. The OpenFaaS Helm chart includes an installation of Prometheus. OpenFaaS also is configured to expose to Prometheus key metrics of the functions and its management.

The Helm chart sets up a Prometheus service, but its not exposed. The Prometheus service can be exposed by changing the service from a _ClusterIP_ type to a _NodePort_ type.

`kubectl patch service prometheus-todo --namespace=openfaas --type='json' --patch='[{"op": "replace",  "path": "/spec/type", "value":"NodePort}]'`{{execute}}

then change the NodePort value to a known port above 30000

`kubectl patch service prometheus-todo --namespace=openfaas --type='json' --patch='[{"op": "replace",  "path": "/spec/ports/0/nodePort", "value":31000}]'`{{execute}}

With these to changes you can view the Prometheus Portal. On the right there is a tab called _Prometheus Portal_ or from this link: https://[[HOST_SUBDOMAIN]]-31113-[[KATACODA_HOST]].environments.katacoda.com/
