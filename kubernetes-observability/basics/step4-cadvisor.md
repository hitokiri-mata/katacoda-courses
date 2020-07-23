Every Node in a Kubernetes cluster has a Kubelet process. Within each Kubelet process is a cAdvisor. The cAdvisor continuously gathers metrics about the state of the Kubernetes resources on each Node. This metrics information is vital to monitor to understand the state of the cluster. This wealth of information is available through the _Resource Metrics API_. Let's inspect the metrics.

Each node exposes statistics continuously updated by cAdvisor. For your cluster, get a list of the node names.

`kubectl get nodes`{{execute}}

For this small Kubernetes cluster on Katacoda, the two node names can be listed.

`export NODE_0=$(kubectl get nodes -o=jsonpath="{.items[0].metadata.name}")`{{execute}}
`export NODE_1=$(kubectl get nodes -o=jsonpath="{.items[1].metadata.name}")`{{execute}}

`echo "The master node is $NODE_0" && echo "The worker node is $NODE_1"`{{execute}}

Open a proxy to the Kubernetes API port.

`kubectl proxy &`{{execute}}

Query the metrics for the master node.

`curl localhost:8001/api/v1/nodes/$NODE_0/proxy/metrics`{{execute}}

Query the metrics for the worker node.

`curl localhost:8001/api/v1/nodes/$NODE_1/proxy/metrics`{{execute}}

The Kubernetes API aggregates cluster-wide metrics at `/metrics`.

`curl localhost:8001/metrics`{{execute}}
