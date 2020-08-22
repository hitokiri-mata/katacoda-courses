Before you can feel the pleasure of destroying a sandle castle, you have to create one. Let's create a small collection of applications. In a production system, perhaps this would be a replication of microservices. For this scenario, you will create a deployment of applications that log random messages. Create a namespace for the deployment:

`kubectl create namespace learning-place`{{execute}}

Run the _random-logger_ container in a Pod to start generating continuously random logging events:

`kubectl create deployment random-logger --image=chentex/random-logger -n learning-place`{{execute}}

Scale to 10 Pods:

`kubectl scale deployment/random-logger --replicas=10 -n learning-place`{{execute}}

All the Pods will be running in a moment:

`kubectl get pods -n learning-place`{{execute}}

> Thank you to _Vicente Zepeda_ for providing this beautifully simple container. The [source code is here](https://github.com/chentex/random-logger).
