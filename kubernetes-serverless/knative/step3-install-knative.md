A few components are needed for a functioning Knative control plane. There are some optional components to install as well. Some of the components can vary by your choosing. These components are tested together with specific versions of Knative. This scenario has been tested with a recent version of Knative and over time, periodic upgrades will be applied.

`export KNATIVE_VERSION=0.16.0`{{execute}}

The following installations will assume [this version](https://github.com/knative/client/releases).

## Install CLI tool `Kn`

`curl -L https://github.com/knative/client/releases/download/v${KNATIVE_VERSION}/kn-linux-amd64 -o /usr/bin/kn && chmod +x /usr/bin/kn`{{execute}}

`kn` will pick up your kubectl config file in the default location of $HOME/.kube/config. Verify `kn` is installed and reports correct version:

`kn version`{{execute}}

## Installing Knative Serving

Serving is the primary layer that provides an abstraction for stateless request-based scale-to-zero services.

Install the Custom Resource Definitions (CRDs) specific for declaring Knative objects:

`kubectl apply --filename https://github.com/knative/serving/releases/download/v${KNATIVE_VERSION}/serving-crds.yaml`{{execute}}

Notice Knative adds extensions (CRDs) to the Kubernetes API.

`kubectl get crds | grep .knative.`{{execute}}

Install the service-core component.

`kubectl apply -f https://github.com/knative/serving/releases/download/v${KNATIVE_VERSION}/serving-core.yaml`{{execute}}

It will take a few moments to start.

`kubectl get deployments,pods,services --namespace knative-serving`{{execute}}

The serving layer is comprised of ...

> TODO