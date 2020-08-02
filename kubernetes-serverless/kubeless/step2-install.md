Create a namespace for the installation target.

`kubectl create namespace kubeless`{{execute}}

Bitnami is now the maintainer of Kubeless. It remains under active development. A recent chart is available in this chart repo.

`helm repo add incubator https://kubernetes-charts-incubator.storage.googleapis.com`{{execute}}

Install Kubeless using the Helm chart.

`helm install --name my-kubeless incubator/kubeless \
  --version 2.1.1 \
  --namespace kubeless \
  --set ui.enabled=true \
  --set rbac.create=true`{{execute}}

As part of the installation there will be two Pods started in the new `kubeless` namespace on your Kubernetes cluster.

- The _Kubeless_ controller deployment will watch for function objects to be created.
- The _Kubeless_ UI deployment serves up a browser-based dashboard showing the functions

Observe the availability of each deployment as they progress from 0 to 1:

`kubectl get deployments,pods --namespace kubeless`{{execute}}

It may take up to 3 to 4 minutes before all the Kubeless containers are _Running_.

New functions can now be deployed to _Kubeless_.
