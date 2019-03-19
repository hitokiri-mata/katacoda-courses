Install the Drone engine from the public Helm chart.

`helm install stable/drone --name drone --namespace drone --set service.type=NodePort --set service.nodePort=31112`{{execute}}

Explore how Drone, the container registry, and Gogs been started on the cluster in their respective namespaces from the Kubernetes Dashboard. Because the dashboard can be accessed publicly, it is protected and requires login credentials. Because you have administration access to this cluster copy the token from this secret.

`kubectl describe secrets`{{execute}}

Next, by clicking on the _Kubernetes Dashboard_ tab above the command line or from this link: https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/. At the sign prompt select _Token_ and paste in the key you copied in the previous step.
