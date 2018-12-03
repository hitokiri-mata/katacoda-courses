#

The cAdvisor data can also be observed through a variety of `kubectl describe` commands across various resources.

Inspect the main Minikube node.

`kubectl describe node minikube`{{execute}}

Inspect the last deployment.

`kubectl describe deployment random-logger`{{execute}}

Inspect the 3 pods.

`kubectl get deployments,pods`{{execute}}

`kubectl describe pods`{{execute}}

Much of this same data is found on the cAdvisor [page](`https://[[HOST_SUBDOMAIN]]-4194-[[KATACODA_HOST]].environments.katacoda.com/`{{execute}}).

Kubernetes also maintains a list of events.

`kubectl get events`{{execute}}

Scaling is a type of event. Scale down the pod from 3 down to 2.

`kubectl scale deployment/random-logger --replicas=2`{{execute}}

Notice the last event will reflectthe scaling request.

`kubectl get events`{{execute}}

These events are not to be confused with [security audit logs](https://kubernetes.io/docs/tasks/debug-application-cluster/audit/) which are also recorded.

You can also typically get into a running container and inspect it as well. Get the name of the first Pod.

`POD=$(kubectl get pod  -o jsonpath="{.items[0].metadata.name}")`{{execute}}

Inspect the script contents inside the container file system.

`kubectl exec $POD -- cat entrypoint.sh`{{execute}}

Or, shell into the container.

`kubectl exec -it $POD -- /bin/sh`{{execute}}

and come back out with the `exit` command.
