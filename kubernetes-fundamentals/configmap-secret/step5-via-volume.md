# Volume Mounts #

This example shows how a Pod accesses configuration data from the ConfigMap by reading from a file in a directory of the container. Upon startup, the application would reference these parameters by referencing the named files in the known directory. View the resource definition.

`cat consume-via-vol.yaml`{{execute}}

Create the Pod that is connected passed the data by way of the environment variables.

`kubectl create -f consume-via-vol.yaml`

Using the Dashboard, inspect the Pod log and information page to see mapped data.
