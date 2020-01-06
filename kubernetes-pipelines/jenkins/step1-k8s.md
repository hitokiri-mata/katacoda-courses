For this scenario, Katacoda has just started a fresh Kubernetes cluster for you. Verify it's ready for your use.

` && kubectl get componentstatus`{{execute}}

The [Helm](https://helm.sh/) package manager used for installing applications on Kubernetes is also available.

`helm version --short`{{execute}}

## Kubernetes Dashboard ##

You can administer your cluster with the `kubectl` CLI tool or use the visual Kubernetes Dashboard. Use this script to access the protected Dashboard.

`dashtoken.sh`{{execute}}