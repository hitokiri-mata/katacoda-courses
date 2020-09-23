Push this container image to the private registry on Kubernetes that was installed in step 2.

`docker push $REGISTRY/mountains-client-secure:0.3.0`{{execute}}

`docker push $REGISTRY/mountains-server-secure:0.3.0`{{execute}}

Inspect the contents of the registry now listing the container image that was just built, tagged, and pushed.

`curl $REGISTRY/v2/_catalog | jq`{{execute}}

