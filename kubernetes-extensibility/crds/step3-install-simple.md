Now that Kubernetes knows about this resource type, let's add an actual resource. Create a YAML file to declare a Thermometer.

```cat <<EOF > thermometer.yaml
apiVersion: d2iq.com/v1beta1
kind: Thermometer
metadata:
    name: simple-thermometer
    namespace: default
EOF
```{{execute}}

The YAML file has been created. There is no data in it, just a name and namespace.

`ccat thermometer.yaml`{{execute}}

The CRD in the previous step instructed Kubernetes on what the resource `kind: Thermometer` means. Because of the CRD, this thermometer declaration can be applied to your Kubernetes cluster.

`kubectl apply -f thermometer.yaml`{{execute}}

Now you have a new Thermometer resource. This is not a new Pod, Container, or Service, instead it is just a representation of a Thermometer.

`kubectl get trm -A`{{execute}}

The -A switch means find the specified resource across **A**ll namespaces.

With this you see how to define and create custom resources. However, you can see this Thermometer type is lacking details that make a thermometer unique, such as a geographic location, a digital metric, and its preferred units. We will expand on this in the next steps but before continuing let's remove this current definition.

Remove the resource.

`kubectl delete trm -n default --all`{{execute}}

Now, the resource is gone.

`kubectl get trm -A`{{execute}}
