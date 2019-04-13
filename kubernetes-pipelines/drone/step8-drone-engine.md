Install the Drone engine from the public Helm chart.

`helm install stable/drone --name drone --namespace drone --set service.type=NodePort --set service.nodePort=31112`{{execute}}

Explore how Drone, the container registry, and Gogs been started on the cluster in their respective namespaces from the Kubernetes Dashboard.

## Kubernetes Dashboard ##

As an alternative to the kubectl CLI you can also observe and control the cluster activity in the Kubernetes Dashboard. Because the dashboard can be accessed publicly, it is protected and requires the secret access token to login. Because you have administration access to this cluster copy the token from this secret.

`echo -e "\n--- Copy and paste this token for dashboard access ---" && kubectl describe secret $(kubectl get secret | awk '/^dashboard-token-/{print $1}') | awk '$1=="token:"{print $2}' && echo "---"`{{execute}}

Next, by clicking on the _Kubernetes Dashboard_ tab above the command line or from this link: https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/. At the signin prompt select _Token_ and paste in the key you copied in the previous step.

> With public and production Kubernetes *always* be sure to lock down any kind of Kubernetes administration access including [access to the dashboard](https://www.wired.com/story/cryptojacking-tesla-amazon-cloud/).
