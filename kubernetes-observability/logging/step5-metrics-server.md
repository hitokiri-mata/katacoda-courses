A common light monitoring application for Kubernetes was Heapster. However, it's in the process of being [retired](https://github.com/kubernetes-retired/heapster/blob/master/docs/deprecation.md) and the substitution is [metrics-server](https://github.com/kubernetes-incubator/metrics-server).

Typically this would be installed with a Helm chart, but for Minikube there is a pretested and opinionated configuration available through Minikube's addon feature.

`minikube addons list`{{execute}}

Enable the metrics-server addon.

`minikube addons enable metrics-server`{{execute}}

Launch the [Minikube dashboard](https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/) and in a few moments, charts and line graphs will start appearing on the dashboard pages. These graphs are provided by the metrics-server.
