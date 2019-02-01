## Versions ##

This Katacoda scenario provides a recent version of the Minikube command line tool (CLI). Katacoda has provided you a Linux virtual machine completely capable of serving up Minikube in the Bash shell to the right.

> After this course, if you want to also run Minikube locally follow these [installation instructions](https://kubernetes.io/docs/tasks/tools/install-minikube/).

Check the current version of Minikube that Katacoda has provided.

`minikube version`{{execute}}

This should be reasonably close to the latest release. On average a new Minikube version is released once a month and it has a _boat load_ of GitHub stars.

`minikube update-check`{{execute}}

Minikube is representing a Kubernetes cluster. When Minikube starts it runs the latest Kubernetes version that it has been tested with and is relatively close to the current release of Kubernetes. The list of Kubernetes versions that Minikube supports can be listed.

`minikube get-k8s-versions`{{execute}}

## Bootstrappers ##

However, this list is only available for the default bootstrapper called _localkube_. The _bootstrapper_ is a plugabble Minikube module responsible for the standing up the single node cluster. As of 2018, _localkube_ has been deprecated and recently removed from Minikube. As of this writing _kubeadm_ is the only officially support bootstrapper. This scenario and others in my _javajon_ courses will ensure the _kubeadm_ bootstrapper is used, until something better comes along.

This version of Minikube on Katacoda for now uses _localkube_. In the near future the Minikube version will be upgraded and moved to _kubeadm_.

The current settings can be listed.

`minikube config view`{{execute}}

In the next step Minikube will be started.
