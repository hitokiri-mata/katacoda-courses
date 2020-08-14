<img align="right" src="./assets/k8s-logo.png" width="100">

For this scenario, Katacoda started a fresh Kubernetes cluster for you. Verify that it's ready:

`kubectl version --short && \
kubectl get componentstatus && \
kubectl get nodes && \
kubectl cluster-info`{{execute}}

The [Helm](https://helm.sh/) package manager used for installing applications on Kubernetes is also available:

`helm version --short`{{execute}}

<img align="right" src="./assets/k8s-dash.png" width="200">

## Kubernetes Dashboard ##

You can administer your cluster with the `kubectl` CLI tool or use the visual Kubernetes Dashboard. Use this script to access the protected Dashboard:

`token.sh`{{execute}}
