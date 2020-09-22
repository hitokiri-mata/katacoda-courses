Push this container image to the private registry on Kubernetes that was installed in step 2.

`docker push $REGISTRY/client-distilled:0.2.0`{{execute}}

`docker push $REGISTRY/server-distilled:0.2.0`{{execute}}

Inspect the contents of the registry now listing the container image that was just built, tagged, and pushed.

`curl $REGISTRY/v2/_catalog | jq`{{execute}}
