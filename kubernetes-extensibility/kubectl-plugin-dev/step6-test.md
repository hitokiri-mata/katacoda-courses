The plugin already has code implemented for the `resources` command and it has an API client that can introspect your Kubernetes cluster resources:

`kubectl example resources`{{execute}}

This will list this Kubernetes cluster resources along with their Names, Namespaced status, and Kind alias. The `resources` command is a code example that was already written. In the next step, you will code your custom command.
