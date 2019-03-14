Install the Drone engine from the public Helm chart.

`helm install stable/drone --name drone --namespace drone --set service.type=NodePort --set service.nodePort=31112`{{execute}}

Explore how Drone, the container registry, and Gogs been started on the cluster in their respective namespaces from the [Dashboard](https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/).
