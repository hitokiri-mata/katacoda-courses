Once running, this Rabbit MQ portal can be seen in your browser.

There is a slight problem with the chart where the NodePort port value is a random value. Most other charts allow you to set this value at installation time. For this example, we need a fixed and known port. As a workaround a patch to the portal http port number is applied.

`kubectl patch service my-rabbit-rabbitmq-ha --namespace=rabbit --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":31000}]'`{{execute}}

Now, you can direct your browser to the "RabbitMQ Portal" from tab above the command line area or from this link: https://[[HOST_SUBDOMAIN]]-31000-[[KATACODA_HOST]].environments.katacoda.com/.

Login with the user name _guest_ and password _guest_.
