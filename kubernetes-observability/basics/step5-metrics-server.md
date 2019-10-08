The de factor light monitoring application for Kubernetes is [metrics-server](https://github.com/kubernetes-incubator/metrics-server). Metrics Server is a metrics aggregator. There is no long term metrics storage, it holds just the latests metrics. Typically, the server may be installed with a Helm chart.

`helm install stable/metrics-server \
--name metrics-server \
--namespace kube-system \
--set args[0]="--kubelet-preferred-address-types=InternalIP" \
--set args[1]="--kubelet-insecure-tls"`{{execute}}

This will install the server in the kube-system namespace along with the last two parameters that allow it to work well in this ephemeral Katacoda cluster.

In a few minutes you should be able to list metrics using the following command:

`kubectl get --raw "/apis/metrics.k8s.io/v1beta1/nodes"`{{execute}}

If the metrics are not ready, this message will appear

> `Error from server (ServiceUnavailable): the server is currently unable to handle the request`

Once the metrics are ready a json dump of the metrics will appear.

`kubectl top node`{{execute}}

If the metrics are not ready you may get this message.

> `Error from server (ServiceUnavaliable): the server is currently unable to handle the request (get nodes.metrics.k8s.io)`

However, once the metrics are available the normal message should look like this:

```
NAME     CPU(cores)   CPU%   MEMORY(bytes)   MEMORY%
master   125m         6%     1049Mi          55%
node01   84m          2%     922Mi           23%
```

Metrics information should also be in the dashboard. Launch the [Kubernetes dashboard](https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/) and in a few moments, charts and line graphs will start appearing on the dashboard pages. These graphs are provided by the metrics-server.
