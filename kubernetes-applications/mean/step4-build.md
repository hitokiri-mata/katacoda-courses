# Build Container Image #

`docker build -t $REGISTRY/mean-k8s:0.1.0 .`{{execute}}

Verify the container images have been build.

`docker images | grep mean-k8s`{{execute}}

Push the image to the container registry.

`docker push USERNAME/mean-k8s:0.1.0`{{execute}}

`curl $REGISTRY/v2/_catalog`{{execute}}
