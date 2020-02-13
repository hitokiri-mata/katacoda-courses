# SonarQube on Kubernetes #

<img align="right" src="/javajon/courses/kubernetes-pipelines/tekton/assets/tekton.png" height="100" width="100">

> Tekton Pipelines is a Kubernetes extension that installs and runs on your Kubernetes cluster. It defines a set of Kubernetes Custom Resources that act as building blocks from which you can assemble CI/CD pipelines. Once installed, Tekton Pipelines becomes available via the Kubernetes CLI (kubectl) and via API calls, just like pods and other resources. Tekton is open-source and part of the CD Foundation, a Linux Foundation project. [-- Tekton Project](https://github.com/tektoncd/pipeline)

Tekton Pipelines are:

- Cloud Native
- Decoupled
- Typed

This scenario allows you to experience Tekton pipelines by allowing you to install Tekton on Kubernetes then defines a pipeline that builds, deploys and runs an example Node.js application.

You will learn:

- how to install a private registry with a UI
- how to install the Tekton controller and optional CLI tool
- how to declare resources specific to defining a CI/CD pipeline
- about various Tekton resources like Resources, Tasks, and Pipelines
- how to kick off a pipeline and inspect its progress
