<img align="right" src="./assets/alpine_linux.png" width="200">

Notorious [Alpine Linux](https://en.wikipedia.org/wiki/Alpine_Linux) based containers are often used as a base container because of their very small image size footprint. Alpine containers are close to 5MBs. A Dockerfile has already been provided that leverage Alpine:

`ccat -l Dockerfile client/Dockerfile-small`{{execute}}`

`ccat -l Dockerfile server/Dockerfile-small`{{execute}}`

See the FROM command references a base container the combined Node into Alpine. Actually, there are two FROM commands. These Dockerfiles also introduce the idea of multi-stage builds. The first stage (`FROM node:X`) does the building and resolution of the dependencies. The second stage (`FROM node:X.X.X-alpineX.X`) simply copies the resulting build artifacts into the final stage. The reason is the first stage has many unneeded files as part of npm install. Except for the final artifacts copied "--from=builder" everything else in the first _builder_ stage is discarded. Notice the last stage is the only one packaged into the final container image, and it's based on Alpine Linux. Let's see how much this saves us:

`docker build -t $REGISTRY/mountains-client-small:0.1.0 -f client/Dockerfile-small .`{{execute}}

`docker build -t $REGISTRY/mountains-server-small:0.1.0 -f server/Dockerfile-small .`{{execute}}

They will take 2-3 minutes to create both Alpine based containers. Once complete, verify the container images have been produced:

`docker images "*/mountains-*"`{{execute}}

By combining a few techniques we reduced the container image size of 184MB, a savings close to ~80%! Smaller images take up less space to store and can be distributed to the cluster, reducing storage costs, network traffic, and startup delays. Some of the techniques applied were:

1. Multi-stage build where the final stage discounts the dependency tree from npm.
2. The multi-stage final container is Alpine instead of Debian based container.

We also applied better documentation techniques. If you have resources or pipelines that benefit from small container images, then use these techniques.

However, there is an additional distillation step to consider next.
