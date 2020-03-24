Fill your cluster will some Pods. First, add a few simple NGINX Pods to the default namespace.

`kubectl create -f nginx.yaml`{{execute}}

Next, add a few more Pods to a second namespace.

`kubectl create namespace more-apps`{{execute}}

`kubectl create --namespace more-apps -f ghost.yaml`{{execute}}

The Deployments and Pods are labeled to both mark these Pods a potential victim targets of the Kube Monkey Pod killer.  They are also labeled for easy observability.

In the next step, we will observe the running containers and how they are randomly disrupted.
