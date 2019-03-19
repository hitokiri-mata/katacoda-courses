>> (TODO, blocking issue as this is a multi-stage build and it will fail because local Docker instance is version 17.03.0-ce and multi-stage builds are a new feature requiring Docker 17.05 or higher)

`docker version`{{execute}}

As a workaround, upgrade Docker. This will take a few minutes.

`sudo apt-get update && sudo apt-get upgrade docker-engine`{{execute}}



and verify it's has been upgraded.

`docker version`{{execute}}


(TODO - assign export USERNAME="user fills in DockHub user name")

`docker build -t $REGISTRY/mean-k8s:0.1.0 .`{{execute}}

Verify the container images have been built.

`docker images | grep mean-k8s`{{execute}}

Push the image to the container registry.

`docker push $REGISTRY/mean-k8s:0.1.0`{{execute}}

`curl $REGISTRY/v2/_catalog`{{execute}}
