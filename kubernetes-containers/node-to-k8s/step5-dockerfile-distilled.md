A Dockerfile has already been provided.

`ccat server/Dockerfile-distilled`{{execute}}`

Build the container. The build command assumes there is a Dockerfile in the current directory. Notice that Gradle is run inside the building stage.

`docker build -t $REGISTRY/client-distilled:0.2.0 .`{{execute}}

`docker build -t $REGISTRY/server-distilled:0.2.0 .`{{execute}}

Verify the container image has been produced.

`docker images "*/client-distilled"`{{execute}}

`docker images "*/server-distilled"`{{execute}}
