With the new registry running, let's push a container to it. Grab an existing container.

`docker pull tensorflow/tensorflow`{{execute}}

Verify the image is now cached locally.

`docker images | grep tensor`{{execute}}

Add a new tag to the new container.

`docker tag tensorflow/tensorflow $REGISTRY/my-tensorflow`{{execute}}

With the image pulled and with a new tag, it now can be deployed to the new registry.

`docker push $REGISTRY/my-tensorflow`{{execute}}

Inspect the contents of the private registry and verify the container has been pushed.

`curl $REGISTRY/v2/_catalog`{{execute}}
