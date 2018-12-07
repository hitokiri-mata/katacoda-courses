# Install Riff #

As you see, your Kubernetes cluster based on Minikube is started now or will be available shortly. Verify it's ready for your use:

`minikube version && minikube status`{{execute}}

Riff is a command line interface for running functions on Knative on Kubernetes.

To install the command line install the binary

`curl -Lo riff-linux-amd64.tgz https://github.com/projectriff/riff/releases/download/v0.2.0/riff-linux-amd64.tgz && tar xvzf riff-linux-amd64.tgz && sudo mv riff /usr/local/bin/`{{execute}}

Verify Riff is available by checking the version:

`riff version`{{execute}}

Using the Riff CLI tool too initialize Knative. This will include initialization of the Istio service mesh and telemetry services.

`riff system install --node-port`{{execute}}

Watch the Pods start

`kubectl get pod --all-namespaces --watch`{{execute T2}}

Once started check one more time.

`kubectl get pod --all-namespaces`{{execute T2 interrupt}}
