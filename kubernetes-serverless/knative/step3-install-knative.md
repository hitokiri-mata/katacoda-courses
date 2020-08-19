Knative consists of two independent and primary components:

- [Serving](https://knative.dev/docs/serving/)
- [Eventing](https://knative.dev/docs/eventing/)

The components are implemented as Kubernetes objects that make up the Knative control plane. This scenario has been tested with a [recent version of Knative](https://github.com/knative/client/releases) and over time, periodic upgrades will be applied.

`export KNATIVE_VERSION=0.16.0`{{execute}}

## Install Knative CLI tool Kn

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

`kubectl apply --filename https://github.com/knative/net-istio/releases/download/v${KNATIVE_VERSION}/net-istio.yaml`{{execute}}

Notice new CRDs are now defined for Knative:

`kubectl get crds | grep .knative.`{{execute}}

It will take a few moments to start the control plane objects:

`kubectl get deployments,pods,services --namespace knative-serving`{{execute}}

The Knative service control plane components perform the following:

| Service          | Purpose     |
| ---------------- | ----------- |
| activator        | Receiving and buffering requests for inactive revisions and reporting metrics to the autoscaler. It also retries requests to a revision after the autoscaler scales the revision based on the reported metrics. |
| autoscaler       | Receives request metrics and adjusts the number of pods required to handle the load of traffic. |
| controller       | Reconciles the public Knative objects and autoscaling CRDs. When a user applies a Knative service to the Kubernetes API, this creates the configuration and route. It will convert the configuration into revisions and the revisions into deployments and Knative Pod Autoscalers (KPAs). |
| webhook          | Intercepts Kubernetes API calls as well as CRD insertions and updates. It sets default values, rejects inconsistent and invalid objects, and validates and mutates Kubernetes API calls. |

Once all the deployments report Available (1), Knative will be installed and ready to use.
