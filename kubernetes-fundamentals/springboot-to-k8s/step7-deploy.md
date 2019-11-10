Deploy the application on Kubernetes using the container image built and pushed in the previous step. The Kubernetes manifest YAML file has a $REGISTRY variable inside of it that needs to be replaced with the actual location of the private registry. Use the `envsubst` command to replace the environment variable.

`cd ~ && envsubst < my-app.yaml > my-app-resolved.yaml`{{execute}}

Inspect the Kubernetes resource declaration for starting the my-app application.

`cat my-app-resolved`{{execute}}

With the corrected location to the private registry, deploy the application.

`kubectl apply -f my-app-resolved.yaml`{{execute}}

In a moment the application will be available.

`kubectl get deployments,pods,services`{{execute}}
