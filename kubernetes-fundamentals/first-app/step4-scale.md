Pods are often replicated for handling parallel requests. The Service will take care of _round robin_ load balancing across the available Pods.

We will scale the hello Pod up and down. First, in another terminal start a continuous loop that puts some load the service.

`while true; do sleep 1; curl -s https://[[HOST_SUBDOMAIN]]-31001-[[KATACODA_HOST]].environments.katacoda.com/ -w 'Time: %{time_total}' | grep -E 'Hostname|Time' | xargs; done`{{execute T2}}

With all the curl requests in the loop, the single Pod instance is producing all the responses. However with distributed systems with a deep pool of resources it's very common to add more processes that can service multiple requests. Ask Kubernetes to scaling up the _echoservice_ across more Pods.

`kubectl scale deployment hello --replicas=3`{{execute T1}}

Kubernetes spins up new and duplicated Pods and the same service begins to balance the requests across the pods.

`kubectl top pod -l run=hello`{{execute T1}}

The call may return and error such as _metrics not available yet_. This just means the Heapster monitoring is still initializing. In a few moments the call will work.

Scale the Pods to zero and see what happens with the same _top_ command and the requests in the other terminal.

`kubectl scale deployment hello --replicas=0`{{execute T1}}

The list will show the pods Terminating, then in a moment the list will be blank.

`kubectl get pods`{{execute T1}}

Notice while the pod count is at zero the service running in Terminal 2 is reporting no responses. Soon the above command will report _No resources found_.

Scale the Pods back to 1 and see how the requests are restored.

`kubectl scale deployment hello --replicas=1`{{execute T1}}

A new pod should show in a moment.

`kubectl get deployments,pods`{{execute T1}}

A few moments later the metrics will be available for the new pod.

`kubectl top pod -l run=hello`{{execute T1}}
