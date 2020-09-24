A Dockerfile has already been provided.

`ccat -l Dockerfile server/Dockerfile-small`{{execute}}`

Build the container. The build command assumes there is a Dockerfile in the current directory. Notice that Gradle is run inside the building stage.

`docker build -t $REGISTRY/mountains-client-small:0.1.0 -f client/Dockerfile-small .`{{execute}}

`docker build -t $REGISTRY/mountains-server-small:0.1.0 -f server/Dockerfile-small .`{{execute}}

Verify the container image has been produced.

`docker images "*/mountains-*"`{{execute}}

By combining a few techniques we reduced the container image size of 184MB, a savings close to ~80%! Smaller images take up less space to store and can be distributed to the cluster, reducing storage costs, network traffic, and startup delays. Some of the techniques applied were:

1. Multi-stage build where the final stage discounts the dependency tree from npm.
2. The multi-stage final container is Alpine instead of Debian based container.

We also applied better documentation techniques. If you have resources or pipelines that benefit from small container images, then use these techniques.
