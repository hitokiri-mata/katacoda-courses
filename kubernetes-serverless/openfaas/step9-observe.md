A good system will have features in place to observe its status, health and activity. Prometheus is a de facto solution for monitoring the metrics of a Kubernetes clusters and its applications. Prometheus is a time series database and with it, various metrics of the functions can be stored over time and observed. The OpenFaaS Helm chart includes an installation of Prometheus. OpenFaaS also is configured to expose to Prometheus key metrics of the functions and its management.

## Prometheus ##

The Helm chart sets up a Prometheus service, but it's not exposed. The Prometheus service can be exposed by changing the service from a _ClusterIP_ type to a _NodePort_ type.

`kubectl patch service prometheus --namespace=openfaas --type='json' --patch='[{"op": "replace", "path": "/spec/type","value":"NodePort"}]'`{{execute}}

then change the NodePort value to a known port above 30000

`kubectl patch service prometheus --namespace=openfaas --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":31120}]'`{{execute}}

With these to changes you can view the Prometheus Portal. On the right there is a tab called _Prometheus_ or from this link: https://[[HOST_SUBDOMAIN]]-31120-[[KATACODA_HOST]].environments.katacoda.com/

## Alert Manager ##

As above, the Helm chart also sets up an AlertManager service. It is also not exposed. The AlertManager service can be exposed by changing the service from a _ClusterIP_ type to a _NodePort_ type.

`kubectl patch service alertmanager --namespace=openfaas --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/## Kubernetes Dashboard ##

As an alternative to the kubectl CLI you can also observe and control the cluster activity in the Kubernetes Dashboard. Because the dashboard can be accessed publicly, it is protected and requires the secret access token to login. Because you have administration access to this cluster copy the token from this secret.

`echo -e "\n--- Copy and paste this token for dashboard access ---" && kubectl describe secret $(kubectl get secret | awk '/^dashboard-token-/{print $1}') | awk '$1=="token:"{print $2}' && echo "---"`{{execute}}

Next, by clicking on the _Kubernetes Dashboard_ tab above the command line or from this link: https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/. At the signin prompt select _Token_ and paste in the key you copied in the previous step.

> With public and production Kubernetes *always* be sure to lock down any kind of Kubernetes administration access including [access to the dashboard](https://www.wired.com/story/cryptojacking-tesla-amazon-cloud/).
type","value":"NodePort"}]'`{{execute}}

then change the NodePort value to a known port above 30000

`kubectl patch service alertmanager --namespace=openfaas --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":31121}]'`{{execute}}

With these to changes you can view the Alertmanager Portal. On the right there is a tab called _Alerts_ or from this link: https://[[HOST_SUBDOMAIN]]-31121-[[KATACODA_HOST]].environments.katacoda.com/

## Grafana ##

It's also helpful to have a good dashboard to see how well the functions are running and how OpenFaaS is scaling the load.

There is a helpful Grafana container configured for OpenFaaS found [here](https://github.com/stefanprodan/faas-grafana). Install this Grafana.

`kubectl -n openfaas run --image=stefanprodan/faas-grafana:4.6.3 --port=3000 grafana`{{execute}}

Expose the dashboard as a service on a known port.

`kubectl -n openfaas expose deployment grafana --type=NodePort --name=grafana`{{execute}}

`kubectl patch service grafana --namespace=openfaas --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":31122}]'`{{execute}}

With these to changes you can view the Grafana dashboard. On the right there is a tab called _Grafana_ or from this link: https://[[HOST_SUBDOMAIN]]-31122-[[KATACODA_HOST]].environments.katacoda.com/dashboard/db/openfaas

The default credentials are admin/admin.
