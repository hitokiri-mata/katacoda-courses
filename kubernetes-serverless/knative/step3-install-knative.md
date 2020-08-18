Knative consists of two primary components:

- [Serving](https://knative.dev/docs/serving/)
- [Eventing](https://knative.dev/docs/eventing/)

The components are implemented as Kubernetes objects that make up the Knative control plane. This scenario has been tested with a [recent version of Knative](https://github.com/knative/client/releases) and over time, periodic upgrades will be applied.

`export KNATIVE_VERSION=0.16.0`{{execute}}

## Install Istio CLI tool `Kn`

`curl -L https://github.com/knative/client/releases/download/v${KNATIVE_VERSION}/kn-linux-amd64 -o /usr/bin/kn && chmod +x /usr/bin/kn`{{execute}}

`kn` will pick up your kubectl config file in the default location of $HOME/.kube/config. Verify `kn` is installed and reports the correct version:

`kn version`{{execute}}

## Installing Knative Serving

In this scenario you're going to install the _Serving_ component. _Serving_ is the primary layer that provides an abstraction for stateless request-based scale-to-zero services.

For the Servicing component three Kubernetes manifests are needed:

- Serving Customer Resource Definitions (CRDs)
- Serving Core as the control plane objects
- Networking that establishes the link between Knative and Istio.

Install these three manifests for _Serving_:

`kubectl apply --filename https://github.com/knative/serving/releases/download/v${KNATIVE_VERSION}/serving-crds.yaml`{{execute}}

`kubectl apply --filename https://github.com/knative/serving/releases/download/v${KNATIVE_VERSION}/serving-core.yaml`{{execute}}

`kubectl apply --filename https://github.com/knative/serving/releases/download/v${KNATIVE_VERSION}/net-istio.yaml`{{execute}}

Notice new CRDs are now defined for Knative:

`kubectl get crds | grep .knative.`{{execute}}

It will take a few moments to start the control plane objects:

`kubectl get deployments,pods,services --namespace knative-serving`{{execute}}

Once all the deployments report Available (1), Knative will be installed and ready to use.
