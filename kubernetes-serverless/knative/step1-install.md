# Install Riff #

As you see, your Kubernetes cluster is started. Verify it's ready for your use:

`kubectl cluster-info`{{execute}}

Knative, by design, has no command line interface. Its a server side framework that allows other platforms to produce their own clients and other ways of interacting with Knative and Kubernetes.

## Install Istio ##

`curl -L https://github.com/knative/serving/releases/download/v0.2.2/istio.yaml   | sed 's/LoadBalancer/NodePort/'   | kubectl apply --filename -`{{execute}}

`kubectl get pods --namespace istio-system`{{execute}}

Request Istio to inject its Envoy sidecars into applications deployed to the _default_ namespace.

`kubectl label namespace default istio-injection=enabled`{{execute}}

## Installing Knative Serving ##

`curl -L https://github.com/knative/serving/releases/download/v0.2.2/release-lite.yaml | sed 's/LoadBalancer/NodePort/' | kubectl apply --filename -`{{execute}}

`kubectl get pods --namespace knative-serving`{{execute}}

Now that Knative is running, the next step is to deploy and application.