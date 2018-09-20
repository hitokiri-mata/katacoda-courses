# Start Kubeless on your Kubernetes Cluster #

As you see, this Kubernetes cluster based on Minikube is available now or will be shortly.

## Install Kubeless CLI tool ##

Let's get the latest CLI binary for this Linux.

- `curl -L http://github.com/kubeless/kubeless/releases/download/v1.0.0-alpha.8/kubeless_linux-amd64.zip -o kubeless.zip`{{execute}}

- `unzip -Cj kubeless.zip "bundles/kubeless_linux-amd64/kubeless" -d /usr/local/bin`{{execute}}

This tool will match the controller installed in the next step.

## Install Kubeless Controller ##

Helm is a package manager for Kubernetes and is initialize and ready. A common Helm _chart_ is predefined for installing _Kubeless_. This command will allow Helm to find the _Kubeless_ chart:

`helm repo add incubator https://kubernetes-charts-incubator.storage.googleapis.com/`{{execute}}

Apply this Helm install command:

`helm install --name my-kubeless --namespace kubeless incubator/kubeless --set rbac.create=true --set ui.enabled=true`{{execute}}

As part of the installation there will be two Pods started in the new `kubeless` namespace on your Kubernetes cluster.

- The _Kubeless_ controller Pod will watch for function objects to be created.
- The _Kubeless_ ui Pod serves up a browser based dashboard showing the functions

Observe the availability of each Pod's deployment go from 0 to 1:

`kubectl get deployments --namespace kubeless --watch`{{execute}}

Once the containers have their _Available_ status reach 1, or at least the controller, break out of the watch with Ctrl-C. New functions can now be deployed to _Kubeless_.