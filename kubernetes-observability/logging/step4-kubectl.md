## Inspect Resources ##

The cAdvisor data can also be observed through a variety of `kubectl describe` commands across various resources.

Inspect the main Minikube _node_.

`kubectl describe node minikube`{{execute}}

Inspect the last _deployment_.

`kubectl describe deployment random-logger`{{execute}}

Inspect the 3 _pods_.

`kubectl get deployments,pods`{{execute}}

`kubectl describe pods`{{execute}}

Much of this same data is found on the cAdvisor [page](`https://[[HOST_SUBDOMAIN]]-4194-[[KATACODA_HOST]].environments.katacoda.com/`{{execute}}).

## Events ##

Kubernetes also maintains a list of events.

`kubectl get events`{{execute}}

Scaling is a type of event. Scale down the pod from 3 down to 2.

`kubectl scale deployment/random-logger --replicas=2`{{execute}}

Notice the last event will reflectthe scaling request.

`kubectl get events`{{execute}}

These events are not to be confused with [security audit logs](https://kubernetes.io/docs/tasks/debug-application-cluster/audit/) which are also recorded.

## Inspecting Containers ##

You can also typically get into a running container and inspect it as well. Get the name of the first Pod.

`POD=$(kubectl get pod  -o jsonpath="{.items[0].metadata.name}")`{{execute}}

Inspect the script contents inside the container file system.

`kubectl exec $POD -- cat entrypoint.sh`{{execute}}

Or, shell into the container.

`kubectl exec -it $POD -- /bin/sh`{{execute}}

and come back out with the `exit` command.

There is a wealth of helpful Linux commands to give you information about the Linux containers. Here are just a few.

`kubectl exec $POD -- uptime`{{execute}}

`kubectl exec $POD -- ps`{{execute}}

`kubectl exec $POD -- stat -f /`{{execute}}

`kubectl exec $POD --container random-logger -- lsof`{{execute}}

`kubectl exec $POD --container random-logger -- iostat`{{execute}}

When the Pod has more than one container, the specific container name may be referenced.

`kubectl exec $POD --container random-logger -- ls -a -l`{{execute}}
