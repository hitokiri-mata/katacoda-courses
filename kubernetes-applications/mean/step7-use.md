# Use Application #

`kubectl patch service my-mean-app-mean-k8s --type='json' --patch='[{"op": "replace",  "path": "/spec/ports/0/nodePort", "value":31001}]'`{{execute}}

With these to changes you can navigate to the MapApp portal. On the right, above the command line there is a tab called _MapApp_ or from this link:

https://[[HOST_SUBDOMAIN]]-31001-[[KATACODA_HOST]].environments.katacoda.com

Cleanup this job with the _delete_ command.

`helm delete my-mean-app --purge`{{execute}}

`helm delete registry --purge`{{execute}}
