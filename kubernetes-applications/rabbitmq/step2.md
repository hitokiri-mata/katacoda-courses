Provisioning RabbitMQ on Kubernetes is easily done by invoking this [stable Helm chart](https://github.com/helm/charts/tree/master/stable/rabbitmq).

`helm install stable/rabbitmq --name my-rabbit --namespace rabbit -f rabbit-values.yaml`{{execute}}

The RabbitMQ containers start fairly quickly so the Pod status may be already running, creating, or initializing. To get a complete status of the deployment availability run this inspection.

`watch kubectl get deployments,pods,services --namespace rabbit`{{execute}}

In a few moments the 3 Pods labeled `pod/my-rabbit-rabbitmq-[1|2|3]` will appear and move to the _Running_ status. Once all are running, discontinue the watch.

```clear```{{execute interrupt}} to ctrl-c and clear the shell.

As an alternative to the kubectl CLI you can also observe the deployment in the Kubernetes Dashboard. Because the dashboard can be accessed publicly, it is protected and requires login credentials. Because you have administration access to this cluster copy the token from this secret.

`kubectl describe secrets`{{execute}}

Next, by clicking on the _Kubernetes Dashboard_ tab above the command line or from this link: https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/. At the sign prompt select _Token_ and paste in the key you copied in the previous step.
