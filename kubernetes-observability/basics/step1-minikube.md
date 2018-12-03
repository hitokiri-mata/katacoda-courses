In this Linux server, Minikube and the Kubernetes CLI tool is already installed for you. Check that they are properly installed.

`minikube version && kubectl version`{{execute}}

OK, we can see that Minikube is in place.

Start the cluster.

`minikube start --extra-config=kubelet.CAdvisorPort=4194`{{execute}}

Great! You now have a running Kubernetes cluster in your online terminal. Minikube started a virtual machine for you, and a Kubernetes cluster is now running in that VM.

`minikube status && kubectl cluster-info`{{execute}}

These two commands are the first commands that touch the topic of observability. This simply asks, do I have a running cluster yes or no.

Notice when we started the Kubernetes cluster we passed to Minikube a port number for cAdvisor. More on cAdvisor in the next step.