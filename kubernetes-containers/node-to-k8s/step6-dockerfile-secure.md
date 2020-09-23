A Dockerfile has already been provided.

`ccat server/Dockerfile-secure`{{execute}}`

Build the container. The build command assumes there is a Dockerfile in the current directory. Notice that Gradle is run inside the building stage.

`docker build -t $REGISTRY/mountains-client-secure:0.3.0 -f client/Dockerfile-secure .`{{execute}}

`docker build -t $REGISTRY/mountains-server-secure:0.3.0 -f server/Dockerfile-secure .`{{execute}}

Verify the container image has been produced.

`docker images "*/mountains-*"`{{execute}}


TODO - observe sizes

## Distroless containers

TODO 

- Less attack surface/Restricted Attack vector
- Avoid Image Vulnerabilities
- Confirms Immutability
- Secure Secret Variables
- Secure Network Connection/Service Call
