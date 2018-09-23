# Install Kubeless #

As you see, your Kubernetes cluster based on Minikube is started now or will be available shortly. Verify it's ready for your use:

`minikube version && minikube status`{{execute}}

## Install Kubeless Controller ##

Helm is a package manager for Kubernetes and is initialized and ready.

`helm version`{{execute}}

A common Helm _chart_ is predefined for installing _Kubeless_. Normally, popular charts appear in the [curated Helm chart repository](https://github.com/kubernetes/charts) and there are plans to move Kubeless there. For now, this `repo add` command will allow Helm to find the Kubeless chart:

`helm repo add incubator https://kubernetes-charts-incubator.storage.googleapis.com/`{{execute}}

To install Kubeless onto Kubernetes apply this command:

`helm install --name my-kubeless --namespace kubeless incubator/kubeless --set ui.enabled=true`{{execute}}

As part of the installation there will be two Pods started in the new `kubeless` namespace on your Kubernetes cluster.

- The _Kubeless_ controller deployment will watch for function objects to be created.
- The _Kubeless_ ui deployment serves up a browser based dashboard showing the functions

Observe the availability of each deployment as they progress from 0 to 1:

`kubectl get deployments --namespace kubeless`{{execute}}

Wait until at the least the controller deployment has its _Available_ status change to 1.

New functions can now be deployed to _Kubeless_.