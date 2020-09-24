<img align="right" src="./assets/jabba-the-hutt-star-wars.png" width="200">

In these next three steps, we are going to look at different ways of packaging Node.js application into container images. This step first looks at how NOT to use Dockerfiles to define a Node.js container image. This example creates a fairly large container image size. Much larger than it should be, and often people fall into some of the bad habits.

A Dockerfile has already been provided for the client and server:

`ccat -l Dockerfile client/Dockerfile-bloated`{{execute}}`

`ccat -l Dockerfile server/Dockerfile-bloated`{{execute}}`

Seems straightforward. In seven lines it leverages an existing Node container, loads the application payload, resolves dependencies with npm install, and serves the application on a port. Notice the same mountains.proto is copied into both containers. This coupling is necessary when two applications exchange the same binary streamed datastructures over gRPC. However, it's the only coupling and each data structure should be in separate, modular proto definitions. Again, these protobufs are language independent.  

Let's build the two containers and see what it produces:

`docker build -t $REGISTRY/mountains-client-bloated:0.1.0 -f client/Dockerfile-bloated .`{{execute}}

`docker build -t $REGISTRY/mountains-server-bloated:0.1.0 -f server/Dockerfile-bloated .`{{execute}}

They will take 2-3 minutes to create both containers. Once, complete verify the container images have been produced:

`docker images "*/mountains-*"`{{execute}}

Notice the size of each container is close to a full _gigabyte_ in size. This is a small demonstration application. Not much actual code. All too often people are assembling applications into bloated container images like this. These Dockerfiles illustrate some poor packaging practices, particularly if they will be deployed to expensive Kubernetes clusters.

In the next step, let's apply some distillation.
