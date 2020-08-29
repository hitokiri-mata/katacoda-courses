The project has a ubiquitous script that will install the Chaos Mesh operator. However, to avoid reinventing a wheel we prefer a Helm chart as it offers commonly used package management with parameters, updates, and uninstall.

Create a namespace for the the Chaos Mesh operator:

`kubectl create namespace chaos-mesh`{{execute}}

Add the chart repository for the Helm chart to be installed:

`helm repo add chaos-mesh https://charts.chaos-mesh.org`{{execute}}

Add the Custom Resource definitions that allow you to control chaos through declarations:

`curl -sSL https://mirrors.chaos-mesh.org/v0.9.0/crd.yaml | kubectl apply -f -`{{execute}}

Install the chart:

```bash
helm install chaos-mesh chaos-mesh/chaos-mesh \
  --version 0.2.0 \
  --namespace chaos-mesh \
  --set dashboard.create=true
```{{execute}}

Verify the Chaos Mesh operator has started its control plane:

`kubectl get deployments,pods,services --namespace chaos-mesh`{{execute}}

Optimally, everything should be running in about ~15 seconds. 