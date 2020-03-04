A thermometer can be created with just the kubectl command.

`kubectl create therm my-simple-therm`{{execute}}

You can also create a YAML file to declare a resource.

```cat <<EOF > thermometer-another.yaml
apiVersion: d2iq.com/v1
kind: Thermometer
metadata:
    name: another-therm
    namespace: default
EOF
```{{execute}}

The declaration can be applied.

'kubectl apply -f thermometer-another.yaml`{{execute}}

At this point there are two new Thermometers registered with Kubernetes. These are not new Pods, Containers or Services, instead they are just... Thermometers.

`kubectl get therms -A`{{execute}}

The -A switch means find the specified resource across `A`ll namespaces.

With this you see how to define and create custom resources. However, you can see this Thermometer type is lacking details that make thermometer unique, such as a geographic location, a digital metric, and its preferred units. We will expand on this in the next steps but before continuing let's remove this current definition.

Remove the resources.

`kubectl delete therms -n default --all`{{execute}}

Now, they are gone.

`kubectl get terms -A`{{execute}}
