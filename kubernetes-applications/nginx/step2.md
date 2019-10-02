The command-line interface (CLI) used to manage Kubernetes is appropriately named `kubectl`. We will use this tool to install the applications. Verify it's working.

`kubectl version`{{execute}}

In the first deployment we simply pass a few parameters that declare to Kubernetes our intent to make Nginx available. Use this command

`kubectl run nginx-one --image=nginx --port=80`{{execute}}

Now inspect the installation in progress

`kubectl get pods`{{execute}}

Nginx starts fairly quickly so the Pod status may be already running creating, or initializing. To get a complete status of the deployment availability run this inspection

`kubectl get deployments,pods,services`{{execute}}.

Nginx is running once the deployment _Available_ status reaches `1` and the Pod status reports `Running`. However, from outside of Kubernetes at this terminal, it cannot be easily reached.

Let's change the Service type for Nginx from ClusterIP to NodePort.

`kubectl expose deployment nginx-one --type=NodePort`{{execute}}

Now check the service list again and notice the nginx-one service now is listed with an URL.

`kubectl get services`{{execute}}.

The service on a random Kubernetes NodePort (some value above 30000) and this next line will force the NodePort to 31111

`kubectl patch service nginx-one --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":31111}]'`{{execute}}

and now the service lists the address for this exposed service's NodePort.

`kubectl get services`{{execute}}.

The UI for nginx-one can be seen from the tab "nginx-one" above the command line area or from this link: https://[[HOST_SUBDOMAIN]]-31111-[[KATACODA_HOST]].environments.katacoda.com/

Next, let's explore a better way to deploy the same application.