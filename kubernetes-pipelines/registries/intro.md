# Container Registries on Kubernetes #

![Registry](/javajon/courses/kubernetes-pipelines/registries/assets/registry.png "Container Registry")

The Registry is a stateless, highly scalable server side application that stores and lets you distribute container images. The Registry is open-source, under the permissive [Apache license](http://en.wikipedia.org/wiki/Apache_License).

## Key Features ##

- Follows the [Docker Registry HTTP API V2](https://docs.docker.com/registry/spec/api/)
- Accepts pushed containers
- Fulfills container requests
- Images persisted to backing PersistentVolume

You will learn how:

- to install a private container registry on Kubernetes
- to install a web interface to reveal the contents of the registry.
