## Establish Private Registry on Kubernetes ##

Add the chart repository for the Helm chart to be installed.

`helm repo add stable https://kubernetes-charts.storage.googleapis.com`{{execute}}

Install the chart.

```bash
helm install registry stable/docker-registry \
  --version 1.9.4 \
  --namespace kube-system \
  --set service.type=NodePort \
  --set service.nodePort=31500
```{{execute}}

This start a private container registry that Camel K will use. To verify it is accessible find the IP and PORT of the service:

`export NODE_PORT=$(kubectl get --namespace default -o jsonpath="{.spec.ports[0].nodePort}" services registry-docker-registry)`{{execute}}

`export NODE_IP=$(kubectl get nodes --namespace default -o jsonpath="{.items[0].status.addresses[0].address}")`{{execute}}

`echo http://$NODE_IP:$NODE_PORT`{{execute}}

`curl http://$NODE_IP:$NODE_PORT`{{execute}}

## Add Portal for Container Registry ##

`kubectl apply -f cluster/registry-ui`{{execute}}
