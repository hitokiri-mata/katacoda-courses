The de factor light monitoring application for Kubernetes is [metrics-server](https://github.com/kubernetes-incubator/metrics-server). Typically, metrics-server may be installed with a Helm chart.

`helm install stable/metrics-server \
--name metrics-server \
--namespace kube-system \
--set args[0]="--kubelet-preferred-address-types=InternalIP" \
--set args[1]="--kubelet-insecure-tls"`{{execute}}

This will install the server in the kube-system namespace along with the last two parameters that allow it to work well in this ephemeral Katacoda cluster.

In a few minutes you should be able to list metrics using the following
command:

`kubectl get --raw "/apis/metrics.k8s.io/v1beta1/nodes"`{{execute}}

Metrics-server should soon be providing the top command with metrics.

`kubectl top node`{{execute}}

If the metrics are not ready you may get this message. 

> `Error from server (ServiceUnavaliable): the server is currently unable to handle the request (get nodes.metrics.k8s.io)`

However, once the metrics are available the normal message should look like this:

> ``

Metrics information should also be in the dashboard. Launch the [Kubernetes dashboard](https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/) and in a few moments, charts and line graphs will start appearing on the dashboard pages. These graphs are provided by the metrics-server.
