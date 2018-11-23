# Scaling #

Pods are often replicated for handling parallel requests. The Service will take care of _round robin_ load balancing across the available Pods.

We will scale the hello Pod up and down. First, in another terminal start a continuous loop that puts some load the service.

`while true; do sleep 1; curl -s $(minikube service hello --url) -w 'Time: %{time_total}' | grep -E 'Hostname|Time' | xargs; done`{{execute T2}}

With this, the single Pod is handling all the requests.

`kubectl get pods`{{execute T1}}

Ask Kubernetes to duplicate the _echoservice_ across more Pods.

`kubectl scale deployment hello --replicas=3`{{execute T1}}

Kubernetes spins up new and duplicated Pods and the same service begins to balance the requests across the pods.

`kubectl top pods`{{execute T1}}

Scale the Pods to zero and see what happens with the same _top_ command and the requests in the other terminal.

`kubectl scale deployment hello --replicas=0`{{execute T1}}

Scale the Pods back to 1 and see how the requests are restored.

`kubectl scale deployment hello --replicas=1`{{execute T1}}
