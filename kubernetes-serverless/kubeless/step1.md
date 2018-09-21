# Install Kubeless #

As you see, your Kubernetes cluster based on Minikube is started now or will be available shortly.

## Install Kubeless Controller ##

Helm is a package manager for Kubernetes and is initialized and ready. A common Helm _chart_ is predefined for installing _Kubeless_. This command will allow Helm to find the _Kubeless_ chart:

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