Minikube has an addons features that deployed common sets of solutions on Kubernetes. These common sets are configured to best opinions and tested to ensure they work correctly with the Minikube Kubernetes combination.

View the list of available addons and see which ones are enabled.

`minikube addons list`{{execute}}

Some of these services may be recognizable. For instance, _efk_ is the popular _ElasticSearch, FluentD, Kabana_ use for logging output from containers and microservices.

Also, to communicate between services a DNS is used, there are two DNS flavors in this list and one is enabled.

_Metrics-server_ is a monitoring solution for containers on Kubernetes. (Heapster preceded metrics-server but has fallen out of favor.) If you run top for the nodes, the request will return and error.

`kubectl top node`{{execute}}

MEtrics-server will, over time, add data that the top feature can reference. Enable the addon and try the top command again.

`minikube addons enable metrics-server`{{execute}}

**It will take about 2-3 minutes** before metrics-server is running. A few minutes later metrics data will be available. Once running, the _top_ command will return metrics instead of an error.

`kubectl top node`{{execute}}

The _top_ command can also inspect Pods.

`kubectl top pods --all-namespaces`{{execute}}

While the addons feature is convenient for standing up a small set of helpful solutions, it's very Minikube centric. All of these solutions and hundreds more are better configured and installed using the [Helm](https://helm.sh/) package manager for Kubernetes.
