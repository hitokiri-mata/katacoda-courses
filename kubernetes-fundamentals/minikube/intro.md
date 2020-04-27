# Minikube #

![Minikube](/javajon/courses/kubernetes-fundamentals/minikube/assets/minikube.png "Minikube")
![Kubernetes](/javajon/courses/kubernetes-fundamentals/minikube/assets/kubernetes.png "Kubernetes")

[Minikube](https://kubernetes.io/docs/setup/minikube/) is a method for creating a local, single-node Kubernetes cluster for development and testing. Setup is completely automated and doesn’t require a cloud provider account.

This scenario takes you through the basics of using Minikube. In the following steps you will learn:

- how to install Minikube,
- how to configure Minikube,
- how the Minikube CLI tool differs from the Kubernetes KubeCtl tool,
- how to inspect a cluster,
- how addons work.

## Key Features ##

- Runs locally and free
- Runs on Mac, Linux and Windows machines
- Looks and feels like Kubernetes targeted for larger clusters
- The community's common way to get started
- Use locally for testing and learning
- Supplies convenience addons for common solutions found in many clusters
- Works well with virtual machines such as VirtualBox
- Administer the single node cluster from the command-line tool
- Well documented and supported by the community

Minikube is _not_ a full blown high-available cluster and should never be considered for production deployments or where security, performance and stability is expected. However, it's a very approachable tool to learn the core concepts of Kubernetes.

More about [Minikube is documented here](https://kubernetes.io/docs/setup/minikube/).
