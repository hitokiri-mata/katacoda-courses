There is a YAML file that associated two containers in a Pod and connects them through mouts to a shared volume between the two containers. This allows the second container to act as a sidecar. Inspect how it is created

`cat sidecar-example.yaml`{{execute}}

Deploy the Pod.

`kubectl create -f sidecar-example.yaml`{{execute}}

Inspect the initialization progress.

`kubectl get pods`{{execute}}

Both containers in the Pod start fairly quickly so the Pod status may be already running, creating, or initializing. One downside is the more containers you put in a Pod, the more time it will take to create, restart and scale. Nginx is running once the status the Pod status reports `Running`.

However, from outside of Kubernetes at this terminal, it cannot be easily reached. Let's change the Service type for Nginx from ClusterIP to NodePort.

`kubectl expose pod sidecar-pod --type=NodePort --port=80`{{execute}}

Now check the service list again and notice the `sidecar-pod` service now is listed with an URL.

`kubectl get services`{{execute}}.

The service on a random Kubernetes NodePort (some value above 30000) and this next line will force the NodePort to 31111

`kubectl patch service sidecar-pod --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":31111}]'`{{execute}}

and now the service lists the address for this exposed service's NodePort.

`kubectl get services`{{execute}}.

Next, let's query the service.
