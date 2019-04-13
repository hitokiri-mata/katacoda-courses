Provisioning RabbitMQ on Kubernetes is easily done by invoking this [stable Helm chart](https://github.com/helm/charts/tree/master/stable/rabbitmq).

`helm install stable/rabbitmq --name my-rabbit --namespace rabbit -f rabbit-values.yaml`{{execute}}

The RabbitMQ containers start fairly quickly so the Pod status may be already running, creating, or initializing. To get a complete status of the deployment availability run this inspection.

`watch kubectl get deployments,pods,services --namespace rabbit`{{execute}}

In a few moments the 3 Pods labeled `pod/my-rabbit-rabbitmq-[1|2|3]` will appear and move to the _Running_ status. Once all are running, discontinue the watch. Use this ```clear```{{execute interrupt}} to ctrl-c and clear the shell or press ctrl-c to break out of the watch.

# Kubernetes Dashboard #

As an alternative to the kubectl CLI you can also observe and control the cluster activity in the Kubernetes Dashboard. Because the dashboard can be accessed publicly, it is protected and requires the secret access token to login. Because you have administration access to this cluster copy the token from this secret.

`echo -e "\n--- Copy and paste this token for dashboard access ---" && kubectl describe secret $(kubectl get secret | awk '/^dashboard-token-/{print $1}') | awk '$1=="token:"{print $2}' && echo "---"`{{execute}}

Next, by clicking on the _Kubernetes Dashboard_ tab above the command line or from this link: https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/. At the signin prompt select _Token_ and paste in the key you copied in the previous step.

> With public and production Kubernetes *always* be sure to lock down any kind of Kubernetes administration access including [access to the dashboard](https://www.wired.com/story/cryptojacking-tesla-amazon-cloud/).