In the first deployment we simply pass a few parameters that declare to Kubernetes our intent to make Nginx available. Use this command

`kubectl create -f sidecar-example.yaml`{{execute}}

Inspect the initialization progress.

`kubectl get pods`{{execute}}

Nginx starts fairly quickly so the Pod status may be already running, creating, or initializing. Nginx is running once the status the Pod status reports `Running`.

However, from outside of Kubernetes at this terminal, it cannot be easily reached. Let's change the Service type for Nginx from ClusterIP to NodePort.

`kubectl expose pod sidecar-pod --type=NodePort --port=80`{{execute}}

Now check the service list again and notice the `sidecar-pod` service now is listed with an URL.

`kubectl get services`{{execute}}.

The service on a random Kubernetes NodePort (some value above 30000) and this next line will force the NodePort to 31111

`kubectl patch service sidecar-pod --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":31111}]'`{{execute}}

and now the service lists the address for this exposed service's NodePort.

`kubectl get services`{{execute}}.

Next, let's query the service.