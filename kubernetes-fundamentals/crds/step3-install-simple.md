Create a YAML file to declare a Thermometer resource.

```cat <<EOF > thermometer-another.yaml
apiVersion: d2iq.com/v1
kind: Thermometer
metadata:
    name: another-therm
    namespace: default
EOF
```{{execute}}

The YAML file has been created.

`cat thermometer-another.yaml`{{execute}}

This declaration can be applied to your Kubernetes cluster.

`kubectl apply -f thermometer-another.yaml`{{execute}}

You ow have a new Thermometer resource. This are not new Pods, Containers, or Service, instead it is just a presentation of a... Thermometer.

`kubectl get trm -A`{{execute}}

The -A switch means find the specified resource across **A**ll namespaces.

With this you see how to define and create custom resources. However, you can see this Thermometer type is lacking details that make a thermometer unique, such as a geographic location, a digital metric, and its preferred units. We will expand on this in the next steps but before continuing let's remove this current definition.

Remove the resources.

`kubectl delete trm -n default --all`{{execute}}

Now, they are gone.

`kubectl get trm -A`{{execute}}
