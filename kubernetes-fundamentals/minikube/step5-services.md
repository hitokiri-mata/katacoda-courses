# Services #

Minikube has a helpful command to list and inspect the Kubernetes services. Some of the services have been exposed as NodePorts. This means there are specific ports (or holes) that have been exposed outside of the cluster for incoming traffic. List the Minikube services.

`minikube service list`{{execute}}

Notice there are already some services running in the kube-admin namespace. These are present because the corresponding Addons are enabled. Two specific services are available as NodePorts for your access, _kubernetes_dashboard and _monitoring_grafana_.

The URLs for these services can be listed.

`minikube service --namespace kube-system kubernetes-dashboard --url`{{execute}}
`minikube service --namespace kube-system monitoring-grafana --url`{{execute}}

Because of the Katacoda virtualization these URLs are not accessible from your browser, however they can be reached with Katacode URLs described in the next step.