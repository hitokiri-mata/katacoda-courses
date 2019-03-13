Kubernetes has a web-based dashboard UI giving visibility into the Kubernetes cluster. The dashboard is deployed into the kube-system namespace. View the status of the deployment with 

`kubectl get pods -n kube-system`{{execute}}

When the dashboard was deployed, it was assigned a NodePort of 30000. This makes the dashboard available to outside of the cluster and viewable. From the [Dashboard](https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/), explore how Drone, the container registry and Gogs been started on the cluster in their respective namespaces.

For your cluster, the latest dashboard yaml definition can be downloaded from https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml.