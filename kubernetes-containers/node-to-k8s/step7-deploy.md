The names of the application components are `mountains-client` and `mountains-server`. All three container variants (bloated, small, and secure) vary by name. You could deploy all three variants on your cluster, but we'll instead just deploy the last `secure` containers you built. The deployment process follows the DRY pattern by using environment variables. We'll use the `secure` variant:

`export SUFFIX=secure`{{execute}}

Later, you can come back to this step and try the other container image names as the suffix such as `bloated` and `small`. For this step, we'll just stick with the `secure` containers you built in the previous step.

## Push Containers

Push the container images to the private registry on Kubernetes that was installed in step 2.

`docker push $REGISTRY/mountains-client-$SUFFIX:0.1.0`{{execute}}

`docker push $REGISTRY/mountains-server-$SUFFIX:0.1.0`{{execute}}

Inspect the contents of the registry now listing the pushed container images:

`curl $REGISTRY/v2/_catalog | jq`{{execute}}

## Deploy Service and Deployment Manifests

The Kubernetes Deployment and Service manifest YAML file for the client and server have a $REGISTRY and $SUFFIXvariables inside. They need to be replaced with the environment values for these keys.

We could have used `kuberctl kustomize` for substituting these parameters, but Kustomize as a templating mechanism oddly falls short accomodating environment variables. We could also use Helm, but it's overkill for this situation. Instead, we simply use the trusted Linux utility called [`envsubst`](https://en.wikipedia.org/wiki/Don't_repeat_yourself).

Use the `envsubst` command to replace the environment variables:

`envsubst < kubernetes/mountains-client.yaml > mountains-client-resolved.yaml`{{execute}}

`envsubst < kubernetes/mountains-server.yaml > mountains-server-resolved.yaml`{{execute}}

Inspect the Kubernetes resource declaration for starting the `mountains` application:

`ccat mountains-client-resolved.yaml`{{execute}}

`ccat mountains-server-resolved.yaml`{{execute}}

Deploy the client and server application to Kubernetes:

`kubectl apply -f mountains-client-resolved.yaml -f mountains-server-resolved.yaml`{{execute}}

In a moment the application will be available:

`kubectl get deployments,pods,services`{{execute}}
