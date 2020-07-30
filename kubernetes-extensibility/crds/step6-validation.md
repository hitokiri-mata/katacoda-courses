Let's try a new Thermometer resource that defines a different city, such as:

`ccat gothenburg-thermometer.yaml`{{execute}}

In the spec section, there are two attributes.

```yaml
    unit: Celsius
    foo: test
```

Will it apply successfully?

`kubectl apply -f gothenburg-thermometer.yaml`{{execute}}

No, because with the `x-kubernetes-preserve-unknown-fields: true` was not present and there is no schema defined for `foo`.

`kubectl get trm -A`{{execute}}

Next, let's add a schema to the CRD using the open API v3 Schema. The following schema has an expanded `schema` section added, along with `status`.

`ccat thermometer-crd-with-validation.yaml`{{execute}}

Apply the expanded CRD that contains the validation.

`kubectl apply -f thermometer-crd-with-validation.yaml`{{execute}}

Try reapplying the Gothenburg Thermometer declaration again.

`kubectl apply -f gothenburg-thermometer.yaml`{{execute}}

Try Stockholm manifest again.

`kubectl apply -f stockholm-thermometer.yaml`{{execute}}

Both thermometer resource declarations fail because the attributes in the spec sections do not meet the schema requirements.

Let's add two correct Thermometers that will pass.

`kubectl apply -f gothenburg-thermometer-valid.yaml`{{execute}}

`kubectl apply -f stockholm-thermometer-valid.yaml`{{execute}}

Inspect the resource information now.

`kubectl get trm -A`{{execute}}
