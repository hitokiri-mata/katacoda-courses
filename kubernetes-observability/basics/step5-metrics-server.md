The de factor light monitoring application for Kubernetes is [metrics-server](https://github.com/kubernetes-incubator/metrics-server). Typically, metrics-server may be installed with a Helm chart.

`helm install metrics-server'{{execute}}

Launch the [Kubernetes dashboard](https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/) and in a few moments, charts and line graphs will start appearing on the dashboard pages. These graphs are provided by the metrics-server.  Metrics server create gather statistics from the Resource Metrics API as well as deducing its own metrics.
