# Conclusion #

You now understand how to run a basic onfiguration of RabbitMQ on Kubernetes. Actual production deployment can certainly be more complex to support persistence and higher availability. If the existing Helm chart is insufficient, consider contributing to the project or create one for your own needs.

## Lessons Learned ##

With these scenarios you have learned how:

- to use the basics of the kubectl CLI tool
- to install RabbitMQ on Kubernetes
- containers are deployed as Deployments in Pods
- a Service can provide access to a replication of Pods

Hopefully you also understand how Kubernetes is a new type of data center _operating system_ that can run your applications - across multiple nodes on your local laptop, a rack of servers, or any cloud target. If you are considering deploying multiple containers that make up a larger solution consider layering on Helm as a package manager for these manifests.

## References ##

- [RabbitMQ](https://www.rabbitmq.com/)
- [RabbitMQ stable Helm chart](https://github.com/helm/charts/tree/master/stable/rabbitmq). 
- [Managing Resources](https://kubernetes.io/docs/concepts/cluster-administration/manage-deployment/)
- [Kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
- [Helm, a package manager for Kubernetes](https://helm.sh/)