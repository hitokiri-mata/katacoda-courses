A Dockerfile has already been provided.

`ccat -l Dockerfile server/Dockerfile-secure`{{execute}}`

Build the container. The build command assumes there is a Dockerfile in the current directory. Notice that Gradle is run inside the building stage.

`docker build -t $REGISTRY/mountains-client-secure:0.3.0 -f client/Dockerfile-secure .`{{execute}}

`docker build -t $REGISTRY/mountains-server-secure:0.3.0 -f server/Dockerfile-secure .`{{execute}}

Verify the container image has been produced.

`docker images "*/mountains-*"`{{execute}}

Notice the Distroless based containers are only slightly larger than the Alpine images, however Distroless base image promise more secure containers.  

## Distroless containers

> "Distroless" images contain only your application and its runtime dependencies. They do not contain package managers, shells, or any other programs you would expect to find in a standard Linux distribution. Restricting what's in your runtime container to precisely what's necessary for your app is a best practice employed by Google and other tech giants that have used containers in production for many years. It improves the signal to noise of scanners (e.g. CVE) and reduces the burden of establishing provenance to just what you need. -- [Distroless](https://github.com/GoogleContainerTools/distroless)

- Restricted attack vector
- Reduces image vulnerabilities
- Enforces immutability
- Protects secret variables
- Secure network connection
