## Install Knative Eventing

Install the Custom Resource Definitions (aka CRDs):

`kubectl apply --filename https://github.com/knative/eventing/releases/download/v${KNATIVE_VERSION}/eventing-crds.yaml`{{execute}}

Install the core components of Eventing (see below for optional extensions):

`kubectl apply --filename https://github.com/knative/eventing/releases/download/v${KNATIVE_VERSION}/eventing-core.yaml`{{execute}}

It will take a few moments to start.

`kubectl get deployments,pods,services --namespace knative-eventing`{{execute}}
