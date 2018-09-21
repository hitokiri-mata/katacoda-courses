# Using Kafka for PubSub Triggers #

(This step is under construction and currently not complete.)

You can trigger any Kubeless function by a [PubSub mechanism](https://kubeless.io/docs/pubsub-functions/). The PubSub function is expected to consume input messages from a predefined topic from a messaging system. Kubeless currently supports using events from Kafka and NATS messaging systems.

## Install Kafka ##

Add the repo where the Kafka chart can be referenced from

`helm repo add incubator http://storage.googleapis.com/kubernetes-charts-incubator`{{execute}}

and install the Kafka chart.

`helm install incubator/kafka --namespace kubeless --name kafka --set rbac.create=true --set kafkaTrigger.enabled=true --set kafkaTrigger.env.kafkaBrokers=brokertodo`{{execute}}

Draft: Next steps are to ensure Kubeless is aware of Kafka via Kubeless chart settings:

kafkaTrigger.enabled=true
kafkaTrigger.env.kafkaBrokers=(tbd)