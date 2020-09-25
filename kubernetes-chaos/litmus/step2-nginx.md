Any set of applications can be made as eligible targets for a chaos system such as Litmus. For this scenario, we'll install the standard NGINX application and make it a target. Install NGINX into the default namespace:

`kubectl create deploy nginx --image=nginx`{{execute}}

In a moment, NGINX will be available and running:

`kubectl get deployments,pods --show-labels`{{execute}}

The deployment should report `1` for available and the Pod status will report `Running`.

```bash
nginx-86c57db685-vpr22   1/1   Running   0   3m15s   app=nginx,pod-template-hash=86c57db685
```
