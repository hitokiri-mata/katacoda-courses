The example Node.js application is simple. Instead of creating an application from complete scratch, this scenario clones an example project.  The source code was inspired by this [article by LogRocket](https://blog.logrocket.com/creating-a-crud-api-with-node-express-and-grpc/).

`git clone https://github.com/javajon/node-mountains`{{execute}}

Go into the directory:

`cd node-mountains`{{execute}}

First, observe the source folder layout:

`tree`{{execute}}

This project is separated into two parts:

1. Server: where gRPC serves the remote calls defined in the proto file
1. Client: Express/Node/Bootstrap web page to CRUD the server operations.

In the source root folder there is a `mountains.proto` file. This defines the gRPC payload called the Protocol Buffer (ProtoBuf). This is the serialized binary data structure that is transmitted between the Web UI and Server containers. Both containers are coupled to this schema.

## Run App Locally

Without containers or Kubernetes we can run both the server and the client web UI locally.

`pushd client && node index& && popd`{{execute}}

`npm start&`{{execute}}

The lynx tool is a text-based HTML browser that runs from the command line:

`lynx http://localhost:3000`{{execute}}

Here is some sample code to populate the skeleton project.

`ccat server/server/js`{{execute}}
