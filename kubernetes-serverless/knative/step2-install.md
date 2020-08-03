For the Knative control plane to function is needs a few required components. There are some optional components to install as well.  Sometimes there are technology choices for some of the layers. All the components are tested with specific versions of Knative. This scenario has been tested with this version of Knative and will be periodically upgraded to keep up with the improvements.

`export KNATIVE_VERSION=0.16.0`{{execute}}

The following installations will assume this version.

## Installing Knative Serving

Serving is the primary layer that provides an abstraction for stateless request-based scale-to-zero services.

Install the Custom Resource Definitions (CRDs) specific for declaring Knative objects:

`kubectl apply --filename https://github.com/knative/serving/releases/download/v${KNATIVE_VERSION}/serving-crds.yaml`{{execute}}

Notice Knative adds extensions (CRDs) to the Kubernetes API.

`kubectl get crds | grep .knative.`{{execute}}

Install the service-core component.

`curl -L https://github.com/knative/serving/releases/download/v${KNATIVE_VERSION}/serving-core.yaml | sed 's/LoadBalancer/NodePort/' | kubectl apply --filename -`{{execute}}

It will take a few moments to start.

`kubectl get deployments,pods,services --namespace knative-serving`{{execute}}

The serving layer is comprised of ...

## Install Istio

Knative supports a variety of Kubernetes networking layers such as:

- Ambassador
- Contour
- Gloo
- Istio
- Kong
- Kourier

For this scenario, install Kourier and add integration with Knative.

`kubectl apply --filename https://github.com/knative/net-kourier/releases/download/v0.16.0/kourier.yaml`{{execute}}

To configure Knative Serving to use Kourier by default:

```bash
kubectl patch configmap/config-network \
  --namespace knative-serving \
  --type merge \
  --patch '{"data":{"ingress.class":"kourier.ingress.networking.knative.dev"}}'```{{execute}}

Fetch the External IP or CNAME:

`kubectl --namespace kourier-system get service kourier`{{execute}}


