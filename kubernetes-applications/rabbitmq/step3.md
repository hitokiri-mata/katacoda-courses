Once running, this Rabbit MQ portal can be seen in your browser from the "RabbitMQ Portal" tab above the command line area or from this link: https://[[HOST_SUBDOMAIN]]-31000-[[KATACODA_HOST]].environments.katacoda.com/.

> SPECIAL NOTE to chart authors: The chart currently has a slight problem in svc.yaml where the NodePort is being applied to the wrong port. Instead of applying the NodePort to named _amqp_ port, it should be applied to the port name _stats_ (the manager ui port).

For this exercise, the access problem can be circumvented. Notice the last port number 3xxxxx on the list of 4 port numbers for the service named _my-rabbit-rabbitmq_.

`minikube service list -n rabbit`{{execute}}

Take that port number and put it in the Katacoda port entry form. This will get you to the RabbitMQ UI.

Login with the user name _guest_ and password _guest_.

The Helm chart configuration has a problem as the nodePort assignment in the rabbit-values.yaml file does not always get assigned to the rabbitmq service responsible to servicing the portal. To correct, select the last port number found in this list of rabbitmq services.

`kubectl get services --namespace rabbit`{{execute}}
