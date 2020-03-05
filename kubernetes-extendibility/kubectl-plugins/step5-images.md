<img align="right" src="/javajon/courses/kubernetes-extensibility/kubectl-plugins/assets/popeye.png" width="300">

Images and Outdated

[Popeye](https://github.com/derailed/popeye) is a utility that scans live Kubernetes cluster and reports potential issues with deployed resources and configurations. Get the plugin description.

Install the plugins.

`kubectl krew install images`{{execute}}

`kubectl krew install outdated`{{execute}}

Enumerate the list of containers used currently in your cluster.

`kubectl images`{{execute}}

Show the list of images that have newer versions.

`kubectl outdated`{{execute}}
