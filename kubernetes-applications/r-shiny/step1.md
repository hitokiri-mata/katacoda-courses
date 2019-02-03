As you see, your Kubernetes cluster based on Minikube is will be available in a moment. Verify it's ready for your use:

`minikube version && minikube status`{{execute}}

Notice that while Minikube is running, there is nothing deployed except for a single service/kubernetes item,

`kubectl get deployments,pods,services`{{execute}}

and no services are listed.

`minikube service list --namespace default`{{execute}}

A clean slate, let's deploy our first application.