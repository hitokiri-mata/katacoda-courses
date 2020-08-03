The latest Knative version that this scenario is validated with is.

`export KNATIVE_VERSION=0.16.0`{{execute}}

The following installation will assume this version.

## Install Custom Resource Definitions

Install the Custom Resource Definitions (CRDs) specific for declaring Knative objects:

`kubectl apply --filename https://github.com/knative/serving/releases/download/v${KNATIVE_VERSION}/serving-crds.yaml`{{execute}}

Notice Knative adds extensions (CRDs) to the Kubernetes API.

`kubectl get crds | grep .knative.`{{execute}}

## Installing Knative Serving

`curl -L https://github.com/knative/serving/releases/download/v${KNATIVE_VERSION}/serving-core.yaml | sed 's/LoadBalancer/NodePort/' | kubectl apply --filename -`{{execute}}

`kubectl get deployments,pods,services --namespace knative-serving`{{execute}}

Now that Knative is running, the next step is to deploy and application.

## Install Istio

Knative support a variety of Kubernetes networking layers such as:

- Ambassador
- Contour
- Gloo
- Istio
- Kong
- Kourier

For this scenario, install Istio and enable its Knative integration.

`curl -L https://github.com/knative/serving/releases/download/v${KNATIVE_VERSION}/service-istio.yaml | sed 's/LoadBalancer/NodePort/' | kubectl apply --filename -`{{execute}}

`kubectl get pods --namespace istio-system`{{execute}}

Notice Istio adds extensions (CRDs) to the Kubernetes API.

`kubectl get crds | grep .istio.`{{execute}}


## Install Knative Eventing

Install the Custom Resource Definitions (aka CRDs):

`kubectl apply --filename https://github.com/knative/eventing/releases/download/v${KNATIVE_VERSION}/eventing-crds.yaml`{{execute}}

Install the core components of Eventing (see below for optional extensions):

`kubectl apply --filename https://github.com/knative/eventing/releases/download/v${KNATIVE_VERSION}/eventing-core.yaml`{{execute}}


## Install Riff ##

TODO - needed?
Knative, by design, has no command-line interface. It's a server side framework that allows other platforms to produce their own clients and other ways of interacting with Knative and Kubernetes.
