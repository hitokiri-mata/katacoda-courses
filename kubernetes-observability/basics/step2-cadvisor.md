# #

Every node in a Kubernetes cluster has a Kubelet process. Within each Kubelet is a cAdvisor process. The cAdvisor is continuously gathering metrics about the state of the cluster. It's handy to extract information right out of cAdvisor as it's always available and provides a wealth of information.

First, open a proxy to the Kubernetes API port.

`kubectl proxy &`{{execute}}

Each node provide statistics that ar provided by cAdvisor. Access the node stats with this command.

`curl localhost:8001/api/v1/nodes/$(kubectl get nodes -o=jsonpath="{.items[0].metadata.name}")/proxy/stats/`{{execute}}

The Kubernetes API also gather the cAdvisor metrics at `/metrics`.

`curl localhost:8001/metrics`{{execute}}

The cAdvisor also serves up the metrics is a helpful HTML format. Without Katacoda your would point your browser at the cluster IP and port 4194 with this command.

`open $(minikube ip):4194`

However, on Katacoda a slight different route is provided. See the [cAdvisor page here](`https://[[HOST_SUBDOMAIN]]-4194-[[KATACODA_HOST]].environments.katacoda.com/`{{execute}}).
