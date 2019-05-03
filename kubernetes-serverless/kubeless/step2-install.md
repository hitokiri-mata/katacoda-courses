Note: The helm chart below is broken. In the meantime, install Kubeless with these commands instead. The UI is currently missing from with this alternative. 

`export RELEASE=$(curl -s https://api.github.com/repos/kubeless/kubeless/releases/latest | grep tag_name | cut -d '"' -f 4)`{{execute}}

`kubectl create ns kubeless`{{execute}}

`kubectl create -f https://github.com/kubeless/kubeless/releases/download/$RELEASE/kubeless-$RELEASE.yaml`{{execute}}

These instructions with a complete UI will be updated soon.
----------
## Helm Chart

A common Helm _chart_ is predefined for installing _Kubeless_. Normally, popular charts appear in the [curated Helm chart repository](https://github.com/kubernetes/charts) and there are plans to move Kubeless there. For now, this `repo add` command will allow Helm to find the Kubeless chart:

`helm repo add incubator https://kubernetes-charts-incubator.storage.googleapis.com/`{{execute}}

To install Kubeless onto Kubernetes apply this command:

`helm install --name my-kubeless --namespace kubeless incubator/kubeless --set ui.enabled=true`{{execute}}

As part of the installation there will be two Pods started in the new `kubeless` namespace on your Kubernetes cluster.

- The _Kubeless_ controller deployment will watch for function objects to be created.
- The _Kubeless_ ui deployment serves up a browser based dashboard showing the functions

Observe the availability of each deployment as they progress from 0 to 1:

`kubectl get deployments,pods --namespace kubeless`{{execute}}

New functions can now be deployed to _Kubeless_.