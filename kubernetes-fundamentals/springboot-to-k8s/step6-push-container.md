Build the container. The build command assumes there is a Dockerfile in the current directory.

`docker build -t $REGISTRY/hello .`{{execute}}

Push this container to the private registry on Kubernetes that was established in step 3.

`docker push $REGISTRY/hello`{{execute}}

Inspect the contents of the registry now listing the container image that was just built, tagged, and pushed.

`curl $REGISTRY/v2/_catalog`{{execute}}
