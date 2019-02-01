Another Addon that is enabled is the standard Kubernetes dashboard. You can get the URL to the dashboard.

`minikube service -n kube-system kubernetes-dashboard --url`{{execute}}

When running Minikube locally the simple invocation

`minikube dashboard`

is a convenient feature to present the dashboard in your local browser tab. Because of Katacoda virtualization this command will not work, but certainly you can explore the dashboard with this link or click on the [Kubernetes Dashboard](https://[[HOST_SUBDOMAIN]]-4194-[[KATACODA_HOST]].environments.katacoda.com/) tab above the command line area.

https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/

The monitoring-grafana service is also available. Explore this monitoring dashboard for Kubernetes.

https://[[HOST_SUBDOMAIN]]-30002-[[KATACODA_HOST]].environments.katacoda.com/
