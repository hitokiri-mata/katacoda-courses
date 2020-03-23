Let's fill your your cluster will some aliens. First, add a few simple NGINX pods to the default namespace.

`kubectl create deployment nginx --image=nginx`{{execute}}

`kubectl scale deployment/nginx --replicas=5`{{execute}}

Next, add a few more Pods (aliens) to a second namespace.

`kubectl create namespace more-apps`{{execute}}

`kubectl create deployment busybox --namespace more-apps --image=busybox`{{execute}}

`kubectl scale deployment/busybox --namespace more-apps --replicas=4`{{execute}}

Label the deployments so you can watch  their status.

`kubectl label deployment nginx app-purpose=chaos --namespace default`{{execute}}

`kubectl label deployment busybox app-purpose=chaos --namespace more-apps`{{execute}}

In the next step, observe the running aliens.
