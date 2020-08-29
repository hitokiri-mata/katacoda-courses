The project has a ubiquitous script that will install the Chaos Mesh operator. To avoid reinveting a wheel we prefer a Helm chart as it offers better package management with parameters and uninstall.

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

The dashboard will also be running and accessible via a NodePort. For this scenario we need the nodePort at a specific value, rather than it's current random port number. Set the nodePort to a specific port:

`kubectl patch service chaos-dashboard --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":31111}]'`{{execute}}

You can now access the dashboard. The web interface for Choas Mesh dashboard can be seen from the tab "Chaos Mesh" above the command-line area or this link: https://[[HOST_SUBDOMAIN]]-31111-[[KATACODA_HOST]].environments.katacoda.com/.
