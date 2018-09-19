# Start OpenFaaS on your Kubernetes Cluster #

Helm is a package manager for Kubernetes and a common Helm _chart_ is predefined for that defines the installation. Use Helm to install OpenFaaS with this install command:

`helm install --name todo`{{execute}}

As part of the installation there will be a few pods started in the new openFaaS namespace on your Kubernetes cluster.
- The OpenFaaS controller Pod will watch for function objects to be created.
- The OpenFaaS ui Pod serves up a browser based dashboard showing the functions

The other two OpenFaaS Pods assist in the PubSub functionality.

`kubectl get pods --namespace openfaas --watch`{{execute}}

Once the containers are running, or at least the controller, break out of the watch with Ctrl-C. New functions can now be deployed to OpenFaaS.