A Dockerfile has already been provided.

`ccat server/Dockerfile-secure`{{execute}}`

Build the container. The build command assumes there is a Dockerfile in the current directory. Notice that Gradle is run inside the building stage.

`docker build -t $REGISTRY/client-secure:0.3.0 .`{{execute}}

`docker build -t $REGISTRY/server-secure:0.3.0 .`{{execute}}

Verify the container image has been produced.

`docker images "*/client-secure"`{{execute}}

`docker images "*/server-secure"`{{execute}}

## Distroless containers

TODO 

- Less attack surface/Restricted Attack vector
- Avoid Image Vulnerabilities
- Confirms Immutability
- Secure Secret Variables
- Secure Network Connection/Service Call
