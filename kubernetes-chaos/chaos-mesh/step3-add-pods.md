Fill your cluster will some Pods. First, add a few simple NGINX Pods to the default namespace.

`kubectl apply -f nginx.yaml`{{execute}}

Next, add a few more Pods to a second namespace.

`kubectl create namespace more-apps`{{execute}}

`kubectl apply --namespace more-apps -f ghost.yaml`{{execute}}

The Deployments and Pods are labeled to mark these Pods as potential victim targets of the Chaoskube Pod killer. They are also labeled for easy observability. See the labels applied to the deployment and Pod template.

`ccat nginx.yaml`{{execute}}

TODO: The Deployment and Pod template declarations have the label `app-purpose: chaos` that makes the Pod an eligible target for Chaoskube. The label is provided as a configuration value during the Helm chart installation.

In the next step, observe the running containers and how they are randomly disrupted.
