Up to now we have just been concentrating on Go and putting you applications in containers. This Katacoda instance also is a running Kubernetes cluster. 

`kubectl get componentstatus`{{execute}}

Run the container you built in the previous step on your Kubernetes cluster.

`kubectl run restafarian --image=restafarian-gin:0.0.1 --generator=run-pod/v1 --port=8080`{{execute}}

Evening if you have never used Kubernetes, this command should look fairly similar to the Docker run commands. Now inspect the installation in progress.

`kubectl get pods`{{execute}}

You applications starts fairly quickly so the Pod status may be already running creating, or initializing. The app is ready for traffic once the Pod status reports `Running`.

However, from outside of Kubernetes at this terminal, it cannot be easily reached. Let's front the Pod with a Service. The service type will be NodePort which will expose the service on a high, random port.

`kubectl expose pod restafarian --type=NodePort`{{execute}}

Check the service list and notice the restafarian service is listed with a high port number.

`kubectl get services`{{execute}}.

The service is assigned a random Kubernetes NodePort (some value above 30000) and this next line will force the NodePort to 31111

`kubectl patch service restafarian --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":31111}]'`{{execute}}

and now the service lists the address for this exposed service's NodePort.

`kubectl get services`{{execute}}.

The REST interface for restafarian service can invoked like before.

`curl --data "topic=Cancer&idea=October is Breast Cancer Awareness month" https://[[HOST_SUBDOMAIN]]-31111-[[KATACODA_HOST]].environments.katacoda.com//ideas/v1/`{{execute T2}}

`curl --data "topic=Cancer&idea=Schedule my next scan" https://[[HOST_SUBDOMAIN]]-31111-[[KATACODA_HOST]].environments.katacoda.com//ideas/v1/`{{execute T2}}

`curl https://[[HOST_SUBDOMAIN]]-31111-[[KATACODA_HOST]].environments.katacoda.com/ideas/v1/`{{execute T2}}
