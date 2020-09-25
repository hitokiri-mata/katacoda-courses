Any set of applications can be made as eligible targets for a chaos system such as Litmus. For this scenario, we'll install the standard NGINX application and make it a target. Install NGINX into the default namespace:

`kubectl create deploy nginx --image=nginx`{{execute}}

In a moment, NGINX will be available and running:

`kubectl get deployments,pods --show-labels`{{execute}}

In a moment, the deployment will report `1` for available and the Pod status will report `Running`.
