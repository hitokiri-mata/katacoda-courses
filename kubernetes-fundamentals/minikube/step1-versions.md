# Minikube Installation #

## Versions ##

This KataCoda course already has a recent and local version of the Minikube command line tool (CLI) already installed. Katacoda has provide you a Linux virtual machine completely capable of serving up Minikube for you in the Bash shell to the right.

> After this course, if you want to also run Minikube locally follow these [installation instructions](https://kubernetes.io/docs/tasks/tools/install-minikube/).

Check our the current version of Minikube that Katacoda provides.

`minikube version`{{execute}}

This should be reasonably close to the latest release. On average a new Minikube version is released once a month and it has a _boat load_ of GitHub stars.

`minikube update-check`{{execute}}

Minikube is of course representing a Kubernetes cluster. When Minikube starts it runs the latest Kubernetes version that it has been tested with and is relatively close to the current release of Kubernetes. The list of Kubernetes versions that Minikube supports can be listed.

`minikube get-k8s-versions`{{execute}}

## Bootstrappers ##

However, this list is only available for the default bootstrapper called _localkube_. The bootstrapper is a plugabble Minikube module that is responsible for the standing up the single node cluster. As of 2018, _localkube_ has been deprecated and recently removed from Minikube. The preferred bootstrapper is now _kubeadm_, as of this writing it's the only officially support bootstrapper. This tutorial will ensure the _kubeadm_ bootstrapper is used, until something better comes along.

Before starting the cluster this command will establish some preferred settings.

`minikube config set WantUpdateNotification false && minikube config set bootstrapper kubeadm`{{execute}}

The current settings can be listed and _kubeadm_ setting confirmed.

`minikube config view`{{execute}}
