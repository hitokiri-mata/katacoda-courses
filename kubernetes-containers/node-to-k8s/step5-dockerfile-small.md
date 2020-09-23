A Dockerfile has already been provided.

`ccat server/Dockerfile-distilled`{{execute}}`

Build the container. The build command assumes there is a Dockerfile in the current directory. Notice that Gradle is run inside the building stage.

`docker build -t $REGISTRY/mountains-client-small:0.2.0 -f client/Dockerfile-small .`{{execute}}

`docker build -t $REGISTRY/mountains-server-small:0.2.0 -f server/Dockerfile-small .`{{execute}}

Verify the container image has been produced.

`docker images "*/mountains-*"`{{execute}}

