Install a Kubernetes dashboard.

`kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml`{{execute}}

Change the service to a NodePort.

`kubectl patch service kubernetes-dashboard -n kube-system --type='json' --patch='[{"op": "replace", "path": "/spec/type","value":"NodePort"}]'`{{execute}}

Expose the NodePort on a predictable port.

`kubectl patch service kubernetes-dashboard -n kube-system --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":30000}]'`{{execute}}


With these to changes, view the [Dashboard](https://[[HOST_SUBDOMAIN]]-31120-[[KATACODA_HOST]].environments.katacoda.com/).