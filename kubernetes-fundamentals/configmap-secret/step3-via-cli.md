# Command Line Arguments #

This example shows how a Pod accesses configuration data from the ConfigMap by passing in the data through the command line arguments when running the container. Upon startup, the application would reference these parameters from the program's command line arguments. View the resource definition.

`cat consume-via-cli.yaml`{{execute}}

Create the Pod that is connected passed the data by way of the environment variables.

`kubectl create -f consume-via-cli.yaml`

Using the Dashboard, inspect the Pod log and information page to see mapped data.
