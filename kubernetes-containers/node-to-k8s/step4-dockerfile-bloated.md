
Build the container. The build command assumes there is a Dockerfile in the current directory. Notice that Gradle is run inside the building stage.

`docker build -t $REGISTRY/client-bloated:0.1.0 .`{{execute}}

`docker build -t $REGISTRY/server-bloated:0.1.0 .`{{execute}}

Verify the container image has been produced.

`docker images "*/client-bloated"`{{execute}}

`docker images "*/server-bloated"`{{execute}}

