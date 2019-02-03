Once running, this Rabbit MQ portal can be seen in your browser from the "RabbitMQ Portal" tab above the command line area or from this link: https://[[HOST_SUBDOMAIN]]-31000-[[KATACODA_HOST]].environments.katacoda.com/.

Login with the user name _guest_ and password _guest_.

The Helm chart configuration has a problem as the nodePort assignment in the rabbit-values.yaml file does not always get assigned to the rabbitmq service responsible to servicing the portal. To correct, select the last port number found in this list of rabbitmq services.

`kubectl get services --namespace rabbit`{{execute}}
