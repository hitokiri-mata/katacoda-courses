A Dockerfile has already been provided.

`ccat -l Dockerfile server/Dockerfile-bloated`{{execute}}`

Build the container. The build command assumes there is a Dockerfile in the current directory. Notice that Gradle is run inside the building stage.

`docker build -t $REGISTRY/mountains-client-bloated:0.1.0 -f client/Dockerfile-bloated .`{{execute}}

`docker build -t $REGISTRY/mountains-server-bloated:0.1.0 -f server/Dockerfile-bloated .`{{execute}}

Verify the container image has been produced.

`docker images "*/mountains-*"`{{execute}}

Notice the size of the containers that are close to a full _gigabyte_ in size. This isa a small demonstration application. Not much actual code. All too often people are assembling applications into bloated container images like this. These Dockerfiles illustrate some poor packaging practices, particularly if they will be deployed to expensive Kubernetes clusters.
