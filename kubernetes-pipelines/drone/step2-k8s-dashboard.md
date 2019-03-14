Kubernetes has a web-based dashboard UI giving visibility into the Kubernetes cluster. The dashboard is deployed into the kube-system namespace. View the status of the deployment with 

`kubectl get pods,services -n kube-system`{{execute}}

For your cluster, the latest dashboard YAML definition can be downloaded from https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml.

The Kubernetes dashboard login requires a security token. You have admin rights, so to reveal the secret by dumping the secret description.

`kubectl describe secrets`{{execute}}

Copy this token an paste into the token field when prompted by the Dashboard. 

> With public and production Kubernetes *always* be sure to lock down any kind of Kubernetes administration access including [access to the dashboard](https://www.wired.com/story/cryptojacking-tesla-amazon-cloud/).