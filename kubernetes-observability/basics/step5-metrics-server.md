A common light monitoring application for Kubernetes was Heapster. However, it has been 's in the process of being [retired](https://github.com/kubernetes-retired/heapster/blob/master/docs/deprecation.md) and the substitution is [metrics-server](https://github.com/kubernetes-incubator/metrics-server).

Typically, metrics-server may be installed with a Helm chart.

`helm install metrics-server'{{execute}}  TODO, test this

Launch the [Kubernetes dashboard](https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/) and in a few moments, charts and line graphs will start appearing on the dashboard pages. These graphs are provided by the metrics-server.
