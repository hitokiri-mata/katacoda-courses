The name of the application is `hello`, so set an environment variable to that name.

`export APP_NAME=mountain-web`{{execute}}

Deploy the application on Kubernetes using the container image built and pushed in the previous step. The Kubernetes manifest YAML file has a $REGISTRY and $APP_NAME variable inside of it that needs to be replaced with the actual location of the private registry and application name. Use the `envsubst` command to replace the environment variables.

`cd ~ && envsubst < mountains-web.yaml > mountains-web-resolved.yaml`{{execute}}

Do the same for the gRPC based server:

`export APP_NAME=mountain-model`{{execute}}

`cd ~ && envsubst < mountains-model.yaml > mountains-model-resolved.yaml`{{execute}}

Inspect the Kubernetes resource declaration for starting the `mountains` application.

`ccat mountains-web-resolved.yaml`{{execute}}

`ccat mountains-model-resolved.yaml`{{execute}}

With the corrected location to the private registry, deploy the application.

`kubectl apply -f mountains-web-resolved.yaml`{{execute}}

`kubectl apply -f mountains-model-resolved.yaml`{{execute}}

In a moment the application will be available.

`kubectl get deployments,pods,services`{{execute}}
