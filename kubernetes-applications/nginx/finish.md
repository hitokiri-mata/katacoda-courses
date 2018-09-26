# Conclusion #

You now understand two different techniques for starting a container on Kubernetes. Nginx is a commonly used for serving up web contents and as you can see is easy to start on Kubernetes. There are thousands of other containers that can easily be started with these same basic steps.

## Lessons Learned ##

With these scenarios you have learned how:

- to use the basics of the kubectl CLI tool
- to install Nginx on Kubernetes
- containers are deployed as Deployments in Pods
- a Service can provide access to a replication of Pods

Hopefully you also understand how Kubernetes is a new type of data center _operating system_ that can run your applications - across multiple nodes on your local laptop, a rack of servers, or any cloud target. If you are considering deploying multiple containers that make up a larger solution consider layering on Helm as a package manager for these manifests.

## References ##

- [Nginx](https://nginx.io/)
- [Managing Resources](https://kubernetes.io/docs/concepts/cluster-administration/manage-deployment/)
- [Kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
- [Helm, a package manager for Kubernetes](https://helm.sh/)