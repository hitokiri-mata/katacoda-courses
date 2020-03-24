Fill your cluster will some Pods. First, add a few simple NGINX Pods to the default namespace.

`kubectl create -f nginx.yaml`{{execute}}

Next, add a few more Pods to a second namespace.

`kubectl create namespace more-apps`{{execute}}

`kubectl create --namespace more-apps -f ghost.yaml`{{execute}}

The Deployments and Pods are labeled to both mark these Pods a potential victim targets of the Kube Monkey Pod killer. They are also labeled for easy observability. See the labels applied to the deployment and Pod template.

`cat nginx.yaml`{{execute}}

The labels are documents in the [Kube Monkey readme](https://github.com/asobti/kube-monkey).

In the next step, observe the running containers and how they are randomly disrupted.
