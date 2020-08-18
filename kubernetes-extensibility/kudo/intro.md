<img align="right" src="./assets/kudo.png" width="400">

Kubernetes Universal Declarative Operator (KUDO) provides a declarative approach to building production-grade Kubernetes Operators covering the entire application life cycle.

> The Cloud Native Computing Foundation (CNCF) has made the KUDO management toolkit, created by D2iQ, a sandbox-level project. 
> –[D2iQ](https://d2iq.com/blog/kudo-accepted-as-a-cncf-sandbox-project) July 2020

## Operator Pattern ##

If you find yourself needing to manage specialized services and solution sets on Kubernetes, writing an [Operator]((https://kubernetes.io/docs/concepts/extend-kubernetes/operator/) often provides controllers to manage these complexities. An Operator contains imperative management logic that reacts to declarative requests and Kubernetes events. There are a variety of projects that offer you frameworks for writing Operators. KUDO is a prominent solution for writing Operators, and this scenario teaches you how to use it.

## About KUDO ##

KUDO is an open source Apache 2.0 project governed by the good people at [D2IQ](https://d2iq.com/), among others. KUDO is a much easier way to write an Operator because it embraces a declarative form over imperative Go-based coding.

In this scenario, you will hand craft an Operator, create an Operator repository, and run the Operator to coordinate with your Kubernetes cluster.

In this scenario you will learn how to:

- Install the KUDO plugin into kubectl
- Generate an Operator
- Configure Operator logic
- Package and Server an Operator
