# Exercise Deployed Application #

The Minikube service list will show a service that exposes two URLs as NodePorts.

`minikube service list -n monitoring-demo`{{execute}}

The hello-world application is in the monitoring-demo namespace. Each services has two NodePorts exposed, one for the service response and one for the metrics response. This is the metrics URL that Prometheus is currently scraping.

`kubectl get pods -n monitoring-demo`{{execute}}

Notice that behind the service are 3 instances of the service running, 2 production and 1 canary.
