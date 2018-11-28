# Environment Variables #

This example shows how a Pod accesses configuration data from the ConfigMap by passing in the data as environmental parameters of the container. Upon startup, the application would reference these parameters as system environment variables.

View the resource definition.

`cat consume-via-env.yaml`{{execute}}

Create the Pod.

`kubectl create -f consume-via-env.yaml`{{execute}}

Using the Dashboard, inspect the Pod log and information page to see mapped data.
