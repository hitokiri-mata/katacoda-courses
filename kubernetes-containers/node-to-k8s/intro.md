<img align="right" src="./assets/node-js.png" width="300">

Ready to climb a mountain? In this scenario you will deploy a small microservices based application that runs on Kubernetes. Two primary topics we will cover are:

1. Discovering some efficient ways of bundling a Node.js application into a distilled container.
1. Discovering how two Node.js applications can communicate through gRPC instead of the common REST techniques.

<img align="right" src="./assets/grpc.png" width="300">
The application consists of two applications. The server application is the model running as a microservice. The client application is a small [express](https://expressjs.com/) web interface. Both applications communicate via gRPC. The UI will present the standard create, read, update, and delete actions (CRUD).

For efficiency, the code has been pre-written, but it's very small and should be easy to dissect and understand.

You will learn how to:

- Write a getting started Node.js web and server application
- Connect two application communicate using gRPC
- Compose a Node.js application into a distilled container
- Push a container to a private registry on Kubernetes
- Instruct Kubernetes to start an application
- Access an application service running on Kubernetes

[Node.js](https://nodejs.org/) is a JavaScript runtime built on Chrome's V8 JavaScript engine.

[Express.js](https://expressjs.com/) is a fast, unopinionated, minimalist web framework for Node.js.

[gRPC](https://grpc.io/) is a high-performance, open source universal RPC framework

All of this you will build into containers and run on Kubernetes.
