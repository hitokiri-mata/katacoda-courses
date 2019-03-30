# Container Registries on Kubernetes #

<img align="right" src="/javajon/courses/kubernetes-pipelines/registries/assets/registry.png">

As a developer of container and Kubernetes solutions there is often a need to publish containers to a private registry. When we are prototyping or testing its handy to setup a local registry that just you or a small group can leverage. Kubernetes is ideal for hosting this solution. 

The Registry is a stateless, highly scalable server side application that stores and lets you distribute container images. The Registry is open-source, under the permissive [Apache license](http://en.wikipedia.org/wiki/Apache_License).

## Key Features ##

- Follows the [Docker Registry HTTP API V2](https://docs.docker.com/registry/spec/api/)
- Accepts pushed containers
- Fulfills container requests
- Images persisted to backing PersistentVolume
- Easily hosted on Kubernetes

You will learn how:

- to install a private container registry on Kubernetes
- to install a web interface to reveal the contents of the registry.
