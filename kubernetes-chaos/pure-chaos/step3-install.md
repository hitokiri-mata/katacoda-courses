Before you can feel the pleasure of destroying a sandle castle, you have to create one. Let's create a small collection of applications. In a production system, perhaps this would be a replication of microservices. For this scenario create a replication of applications that logs random messages.

Run the _random-logger_ container in a Pod to start generating continuously random logging events:

`kubectl create deployment random-logger --image=chentex/random-logger`{{execute}}

Scale to 10 Pods:

`kubectl scale deployment/random-logger --replicas=10`{{execute}}

All the Pods will be running in a moment:

`kubectl get pods`{{execute}}

> Thank you to _Vicente Zepeda_ for providing this beautifully simple container. The [source code is here](https://github.com/chentex/random-logger).
