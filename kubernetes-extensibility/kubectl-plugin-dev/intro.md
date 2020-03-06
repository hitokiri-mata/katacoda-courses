# Creating A Kubectl Plugin #

![Kubernetes](/javajon/courses/kubernetes-extensibility/kubectl-plugin-dev/assets/kubernetes.png "Kubernetes")

This scenario takes you through the introductory steps for developing a kubectl plugin. Through this scenario you create a plugin that will interact with a Kubernetes cluster. While its written in Go the steps will guide you, even if you are a bit new at writing code in GoLang.

In this scenario you will learn how to:

- Access the API via `kubectl`
- Introspect objects in the cluster vi the API
- Access the cluster API locally through a Proxy
- Discover api-resources and api-versions
- Discover the Explain and Describe commands
