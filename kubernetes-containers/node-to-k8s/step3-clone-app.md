<img align="right" src="./assets/node-js.png" width="200">
The example Node.js application is simple. Instead of creating an application from scratch, this scenario clones an example project. The source code was inspired by this [article by LogRocket](https://blog.logrocket.com/creating-a-crud-api-with-node-express-and-grpc/).

`git clone https://github.com/javajon/node-mountains`{{execute}}

Go into the directory:

`cd node-mountains`{{execute}}

First, observe the source folder layout:

`tree`{{execute}}

This project is separated into two parts:

1. Server: where gRPC serves the remote calls defined in the proto file
1. Client: Express/Node/Bootstrap web page to CRUD the server operations.

The client and server folder contain not just the source code, but three different Dockerfile flavors. In the following steps, we will look at the different container image packaging techniques. There is also a Kubernetes folder holding manifests to run the application on Kubernetes. But first, explore the application code.

## The ProtoBuf

In the root folder, there is a `mountains.proto` file. This defines the gRPC payload called the Protocol Buffer (ProtoBuf):

`ccat mountains.proto`{{execute}}

This is a agnostic definition of the serialized binary data structure that is transmitted between the Web UI and Server containers. Its agnostics of and language, platform, stack, architecture or framework that decides to communicate via gRPC. In this scenario, both the server and client containers are coupled to this schema. gRPC serializes binary data structures between different endpoints. gRPC is available for 10 different languages and this ProtoBuf ensures futures languages can also be supported.

## The Server

The server is just one Node.js file:

`ccat server/src/server.js`{{execute}}

The code is a basic CRUD model that holds in memory a list of mountains. With a real microservice this mountain of data would most likely be safely kept in a persistent datastore. The server exposes its gRPC channel on the arbitrary port 8321.

## The Client

Distracting ourselves on how express.js works is outside the scope of the scenario, but all the source code is there so you can dissect at any time how the web interface is constructed. The entry point into the client is index.js:

`ccat client/src/index.js`{{execute}}

A series of calls from the app's UI are implemented. Each path makes a gRPC call. The connection to gRPC is through:

`ccat client/src/client.js`{{execute}}

`process.env.MOUNTAINS_SERVER` refers to the address of the mountains server. When you get this running on Kubernetes, this is just the name of the mountain service. The client starts services its web UI on port 3000. An environment variable is provide to the application to connect to the mountains service.

Before we get into running this on Kubernetes, let's package both the client and server Node.js applications into container images.
