Let's try a new Thermometer resource that defines a different city, such as:

`ccat gothenburg-thermometer.yaml`{{execute}}

In the spec section, there are two attributes.

```yaml
    unit: Celsius
    foo: test
```

Will it apply successfully?

`kubectl apply -f gothenburg-thermometer.yaml`{{execute}}

No, because the schema is rejecting the resource declaration because the column specification is present. Before you were able to apply both thermometer.yaml and stockholm-thermometer.yaml because the schema was minimal. Let's add a schema to the CRD using the open API v3 Schema. The following schema has an expanded `schema` section added, along with `status`.

`ccat thermometer-crd-with-validation.yaml`{{execute}}

Apply the expanded CRD that contains the validation.

`kubectl apply -f thermometer-crd-with-validation.yaml`{{execute}}

Try reapplying the Gothenburg Thermometer declaration again.

`kubectl apply -f gothenburg-thermometer.yaml`{{execute}}

Try Stockholm manifest again.

`kubectl apply -f stockholm-thermometer.yaml`{{execute}}

Both thermometer resource declarations fail because the attributes in the spec sections do not meet the schema requirements.

To correct the specification, add two well-defined Thermometers that will pass.

`ccat gothenburg-thermometer-valid.yaml`{{execute}}

`kubectl apply -f gothenburg-thermometer-valid.yaml`{{execute}}

`ccat stockholm-thermometer-valid.yaml`{{execute}}

`kubectl apply -f stockholm-thermometer-valid.yaml`{{execute}}

Inspect the resource information now.

`kubectl get trm -A`{{execute}}

Now the columns and data appear. In the definition, the `temperature` data is in the status section as this is data that would be filled in at runtime, perhaps from a temperature sensor as an example.
