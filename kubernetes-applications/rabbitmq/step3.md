Once running, this Rabbit MQ portal can be seen in your browser.

There is a slight problem with the chart that is detailed at the bottom of this page, but as a workaround a patch to the port number can be applied.

`kubectl patch service my-rabbit-rabbitmq --namespace=rabbit --type='json' --patch='[{"op": "replace", "path": "/spec/ports/3/nodePort", "value":31000}]'`{{execute}}

Now, you can direct your browser to the "RabbitMQ Portal" from tab above the command line area or from this link: https://[[HOST_SUBDOMAIN]]-31000-[[KATACODA_HOST]].environments.katacoda.com/.

Login with the user name _guest_ and password _guest_.

The Helm chart configuration has a problem as the nodePort assignment in the rabbit-values.yaml file does not always get assigned to the rabbitmq service responsible to servicing the portal. To correct, select the last port number found in this list of rabbitmq services.

`kubectl get services --namespace rabbit`{{execute}}

<hr>
> SPECIAL NOTE to the stable/rabbitmq chart authors: The chart currently has a slight problem in svc.yaml where the service.nodePort is being applied to the wrong port. Instead of applying the NodePort to named _amqp_ port, it should be applied to the port name _stats_ (the manager ui port).
