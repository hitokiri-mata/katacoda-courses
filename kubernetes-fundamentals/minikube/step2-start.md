# Start Kubernetes #

Use the Minikube _start_ command to standup a single node Kubernetes cluster.

`minikube start`{{execute}}

The cluster starts up in a moment or two. These Katacoda servers are fairly fast and the experience on your local machine with the _start_ command will most likely be slower. However, [Moorse's Law](https://en.wikipedia.org/wiki/Moore%27s_law) is always adjusting our expectations.

Verify Minikube is running.

`minikube status`{{execute}}

It's running on a single machine.

`minikube ip`{{execute}}

And, there should be nothing notable in the logs.

`minikube logs`{{execute}}
