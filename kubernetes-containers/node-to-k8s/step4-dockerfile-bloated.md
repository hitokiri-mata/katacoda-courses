A Dockerfile has already been provided.

`ccat -l Dockerfile server/Dockerfile-bloated`{{execute}}`

Build the container. The build command assumes there is a Dockerfile in the current directory. Notice that Gradle is run inside the building stage.

`docker build -t $REGISTRY/mountains-client-bloated:0.1.0 -f client/Dockerfile-bloated .`{{execute}}

`docker build -t $REGISTRY/mountains-server-bloated:0.1.0 -f server/Dockerfile-bloated .`{{execute}}

Verify the container image has been produced.

`docker images "*/mountains-*"`{{execute}}
