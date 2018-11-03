# Install Camel-K #

As you see, your Kubernetes cluster based on Minikube is started now or will be available shortly. Verify it's ready for your use:

`minikube version && minikube status`{{execute}}

`minikube addons enable registry`{{execute}}

Camel-K has a command line interface for installing, inspecting, running functions on Kubernetes. Camel-K also leverages the advantages of Knative and Istio.  

To install the command line install the binary

`curl -Lo kamel.gz https://github.com/apache/camel-k/releases/download/0.0.4/camel-k-client-0.0.4-linux-64bit.tar.gz && tar xvzf kamel.gz && sudo mv kamel /usr/local/bin/`{{execute}}

Verify the CLI is available by checking the version:

`kamel version`{{execute}}

Using CLI tool initialize Camel-K. This will include initialization of the Istio service mesh and telemetry services.

`kamel install`{{execute}}

Watch the services start

`kubectl -w get deployments --all-namespaces`{{execute T2}}

Once started Ctrl-C.

kamel run https://github.com/apache/camel-k/blob/master/runtime/examples/Sample.java

