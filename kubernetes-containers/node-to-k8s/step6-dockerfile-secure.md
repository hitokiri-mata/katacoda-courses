<img align="right" src="./assets/oci.png" width="200">

Let's take distillation a step further with containers based on _distroless_:

`ccat -l Dockerfile client/Dockerfile-secure`{{execute}}`

`ccat -l Dockerfile server/Dockerfile-secure`{{execute}}`

Distroless containers are minimal containers derived from [scatch](https://hub.docker.com/_/scratch) containers that omit any Linux distribution artifacts. Distroless and gRPC are projects governed by Google. Like gRPC, Distroless is all about efficiency. Distroless containers follow the mantras of the distillation pattern for containers. Let's see how much this saves us:

`docker build -t $REGISTRY/mountains-client-secure:0.1.0 -f client/Dockerfile-secure .`{{execute}}

`docker build -t $REGISTRY/mountains-server-secure:0.1.0 -f server/Dockerfile-secure .`{{execute}}

They will take 1-2 minutes to create both Distroless based containers. Once complete, verify the container images have been produced:

`docker images "*/mountains-*"`{{execute}}

Notice the Distroless based containers are near the same size as the Alpine images and still significantly smaller than the first bloated images. Distroless based images promise higher security over Alpine. Where Alpine primarily offers the smallest image size. No matter what base image you choose, be sure you thoroughly test your application in the base to decide use. Some larger applications have historically had occasional trouble with Alpine based packaging, often due to the [musl libc](https://www.musl-libc.org/) implementation variants.

## Distroless containers

> "Distroless" images contain only your application and its runtime dependencies. They do not contain package managers, shells, or any other programs you would expect to find in a standard Linux distribution. Restricting what's in your runtime container to precisely what's necessary for your app is a best practice employed by Google and other tech giants that have used containers in production for many years. It improves the signal to noise of scanners (e.g. CVE) and reduces the burden of establishing provenance to just what you need. -- [Distroless](https://github.com/GoogleContainerTools/distroless)

Some Distroless advantages:

- Restricted attack vector
- Reduces image vulnerabilities
- Enforces immutability
- Protects secret variables
- Secure network connection

However, you may find debugging distroless containers may sometimes be frustrating because you can't shell into them and inspect artifacts. There's no shell or package manager since that's a potential attack vector as well as having nothing to do with the requirements of your business application. With Kubernetes, sometimes developers will add sidecars or the newish [ephemeril containers](https://kubernetes.io/docs/concepts/workloads/pods/ephemeral-containers/#ephemeral-containers-api) next to the distroless containers for debugging and diagnostics.
