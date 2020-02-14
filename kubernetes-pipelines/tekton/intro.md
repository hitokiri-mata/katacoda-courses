# Tekton on Kubernetes #

The Tekton Pipelines project provides Kubernetes-style resources for declaring CI/CD-style pipelines.

This scenario allows you to experience Tekton pipelines by showing you how to install Tekton on Kubernetes then define a pipeline that builds, deploys and runs an example Node.js application.

<img align="right" src="/javajon/courses/kubernetes-pipelines/tekton/assets/tekton.png" width="350">

> Tekton Pipelines is a Kubernetes extension that installs and runs on your Kubernetes cluster. It defines a set of Kubernetes Custom Resources that act as building blocks from which you can assemble CI/CD pipelines. Once installed, Tekton Pipelines becomes available via the Kubernetes CLI (kubectl) and via API calls, just like pods and other resources. Tekton is open-source and part of the CD Foundation, a Linux Foundation project. [-- Tekton Project](https://tekton.dev/)

Tekton Pipelines are:

- Cloud Native
- Decoupled
- Typed

You will learn:

- how to install a private registry with a UI
- how to install the Tekton controller and optional CLI tool
- how to declare resources specific to defining a CI/CD pipeline
- about various Tekton resources like Resources, Tasks, and Pipelines
- how to kick off a pipeline and inspect its progress
