This Katacoda scenario provides a recent version of the Minikube command-line tool (CLI). Katacoda has provided you a Linux virtual machine completely capable of serving up Minikube in the Bash shell to the right.

> After this course, if you want to also run Minikube locally follow these [installation instructions](https://kubernetes.io/docs/tasks/tools/install-minikube/).

Check the current version of Minikube that Katacoda has provided.

`minikube version`{{execute}}

This should be reasonably close to the latest release. On average a new Minikube version is released once a month and it has a _boat load_ of GitHub stars.

`minikube update-check`{{execute}}

The current settings can be listed.

`minikube config view`{{execute}}

In the next step Minikube will be started.
