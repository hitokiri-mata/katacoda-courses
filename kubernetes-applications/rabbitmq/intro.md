# RabbitMQ on Kubernetes #

<img align="right" src="/javajon/courses/kubernetes-applications/rabbitmq/assets/rabbitmq.png">

Robust messaging for applications to connect and scale.

These next steps provide an ideal place to start deploying and running your first application on Kubernetes. With a Kubernetes cluster based on Minikube and a CLI tool called kubectl, a few steps will get a RabbitMQ running.

You will learn how:

- to use the basics of the kubectl CLI tool
- to install RabbitMQ on Kubernetes
- containers are deployed as Deployments in Pods
- a Service can provide access to a replication of Pods

> [RabbitMQ](https://www.rabbitmq.com/) is an open source message broker software (sometimes called message-oriented middleware) that originally implemented the Advanced Message Queuing Protocol (AMQP) and has since been extended with a plug-in architecture to support Streaming Text Oriented Messaging Protocol (STOMP), Message Queuing Telemetry Transport (MQTT), and other protocols.

> The RabbitMQ server program is written in the Erlang programming language and is built on the Open Telecom Platform framework for clustering and failover. Client libraries to interface with the broker are available for all major programming languages. [-- Wikipedia](https://en.wikipedia.org/wiki/RabbitMQ)