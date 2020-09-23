The names of the application components are `mountains-client` and `mountains-server`. We'll use the secure version of the containers. These containers are this version:  

`export APP_VERSION=0.3.0`{{execute}}

Set an environment variable to the name of the secure client container.

`export APP_NAME=mountains-client-secure`{{execute}}

Deploy the application on Kubernetes using the container image built and pushed in the previous step. The Kubernetes manifest YAML file has a $REGISTRY, $APP_NAME, and $APP_VERSION variables inside of it that need to be replaced with the actual location of the private registry and application name. Use the `envsubst` command to replace the environment variables.

`cd ~ && envsubst < mountains-client.yaml > mountains-client-resolved.yaml`{{execute}}

Do the same for the gRPC based server:

`export APP_NAME=mountains-server-secure`{{execute}}

`cd ~ && envsubst < mountains-server.yaml > mountains-server-resolved.yaml`{{execute}}

Inspect the Kubernetes resource declaration for starting the `mountains` application.

`ccat mountains-client-resolved.yaml`{{execute}}

`ccat mountains-server-resolved.yaml`{{execute}}

With the corrected location to the private registry, deploy the application.

`kubectl apply -f mountains-client-resolved.yaml`{{execute}}

`kubectl apply -f mountains-server-resolved.yaml`{{execute}}

In a moment the application will be available.

`kubectl get deployments,pods,services`{{execute}}
