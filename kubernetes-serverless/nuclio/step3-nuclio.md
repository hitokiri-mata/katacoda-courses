As you see, your Kubernetes cluster based on Minikube is started now or will be available shortly. Verify it's ready for your use:

`minikube version && minikube status`{{execute}}

Helm is a package manager for Kubernetes and is initialized and ready.

`helm version`{{execute}}

A common Helm _chart_ is predefined for installing Nuclio. Normally, popular charts appear in the [curated Helm chart repository](https://github.com/kubernetes/charts) and there may be plans to move Nuclio there. For now, this `repo add` command will allow Helm to find the Nuclio chart:

`helm repo add nuclio https://nuclio.github.io/nuclio/charts`{{execute}}

Install the Nuclio controller

`helm install nuclio/nuclio --name=nuclio --namespace=nuclio --set rbac.create=false --set dashboard.nodePort=32050`{{execute}}

Watch Nuclio starting and verify it's _Available_.

`kubectl --namespace=nuclio get deployments`{{execute}}
