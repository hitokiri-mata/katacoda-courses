Install the Drone engine from the public Helm chart.

`helm install stable/drone --name drone --namespace drone --set service.type=NodePort --set service.nodePort=31112`{{execute}}

Explore how Drone, the container registry, and Gogs been started on the cluster in their respective namespaces from the Kubernetes Dashboard.

## Kubernetes Dashboard ##

As an administrator, you can control the cluster with the `kubectl` CLI tool. You can also use the Kubernetes Dashboard. Because the dashboard can be accessed publicly, it is protected and requires the secret access token to sign in. Because you have administration access to this cluster, copy the token from this secret.

`echo -e "\n--- Copy and paste this token for dashboard access ---" && kubectl describe secret $(kubectl get secret | awk '/^dashboard-token-/{print $1}') | awk '$1=="token:"{print $2}' && echo "---"`{{execute}}

To access the dashboard, click on the _Kubernetes Dashboard_ tab above the command line or from this link: https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/. At the sign in prompt select _Token_ and paste in the token, you copied a moment ago.

> For publicly exposed Kubernetes clusters *always* lock any kind of Kubernetes administration access including [access to the dashboard](https://www.wired.com/story/cryptojacking-tesla-amazon-cloud/).