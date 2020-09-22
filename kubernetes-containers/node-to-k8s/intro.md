<img align="right" src="./assets/node-js.jpg" width="300">

The scenario walks through a series of steps that go from a simple Node.js application to packaging it in a container image, then run it on Kubernetes. This scenario also introduces you to the Img tool for building container images.

[Img](https://github.com/genuinetools/img) is an open source tool that builds container images. Img is more cache-efficient than Docker and can also execute multiple build stages concurrently. Img produces OCI compatible container images that we can run on Kubernetes. [Jess Frazelle](https://github.com/jessfraz) has based the Img tool on the Moby Project's [BuildKit](https://github.com/moby/buildkit) toolkit.

Starting with a blank Kubernetes cluster we build and run the application.

1. Clone a simple source for two Node.js containers for a demo application
1. A simple web interface app and a REST app that perform CRUD actions for a model.
1. Package Node.js apps using an inefficient Dockerfile
1. Package the apps using an optimized Dockerfile using multi-stage techniques
1. Use the Img tool to build OCI images.
1. Push the container to a local, private registry
1. Send a declaration to Kubernetes to start the demo application
1. Run the application

You will learn how to:

- write a getting started Node.js web UI and REST application
- Use the Img tool to build OCI container images
- push a container to a private registry on Kubernetes
- instruct Kubernetes to start and application
- access an application service running on Kubernetes
