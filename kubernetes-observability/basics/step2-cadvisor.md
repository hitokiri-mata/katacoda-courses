Every Node in a Kubernetes cluster has a Kubelet process. Within each Kubelet process is a cAdvisor. The cAdvisor continuously gathers metrics about the state of the Kubernetes resources on each Node. This metrics information is vital to monitor to understand the state of the cluster. This wealth of information is available through the _Resource Metrics API_. Let's inspect the metrics.

First, open a proxy to the Kubernetes API port.

`kubectl proxy &`{{execute}}

Each node exposes statistics continuously updated by cAdvisor. For your cluster, get a list of the node names.

`kubectl get nodes`{{execute}}

For this small Kubernetes cluster on Katacoda the two names are named _master_ and _node01_.

`export NODE=master`{{execute}}

Access the worker node statistics with this command to the Metrics API.

`curl localhost:8001/api/v1/nodes/$NODE/proxy/stats/`{{execute}}

`curl localhost:8001/api/v1/nodes/$(kubectl get nodes -o=jsonpath="{.items[0].metadata.name}")/proxy/metrics`{{execute}}

The Kubernetes API aggregates cluster wide metrics at `/metrics`.

`curl localhost:8001/metrics`{{execute}}

----

In the past there was no _Resource Metrics API_ and a service called _Heapster_, now deprecated, used to gather all the cAdvisor metrics and bit more manually. Around the 1.6 to 1.8 Kubernetes releases the _Resource Metrics API_ was added. In concert, Heapster was removed and _Metrics Server_ is now the de facto service that aggregates metrics from the Metrics API.

Metrics server is a lighter version of Heapster. It gathers the latest metrics for reference and does not store historical data. For accumulation of trending metric the de facto Prometheus time series database can optionally be added to a cluster.

The [exposed metrics are documented here](https://github.com/kubernetes/kube-state-metrics/tree/master/docs).