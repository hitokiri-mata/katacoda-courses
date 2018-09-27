# Deploy RabbitMQ #

Provisioning RabbitMQ on Kubernetes is easily done by invoking this [stable Helm chart](https://github.com/helm/charts/tree/master/stable/rabbitmq).  

`helm install stable/rabbitmq --name my-rabbit --namespace rabbit --set replicas=3 --set serviceType=NodePort --set rabbitmq.nodePort=31333 --set rabbitmq.username=admin --set rabbitmq.password=admin`{{execute}}
