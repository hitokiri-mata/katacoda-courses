Let's try a new Thermometer resource that defines a different city, such as:

`ccat gothenburg-thermometer.yaml`{{execute}}

In the spec section there are two attributes, `unit` and `foo`. Will it successfully apply?

`kubectl apply -f gothenburg-thermometer.yaml`{{execute}}

Get all the current Thermometers.

`kubectl get trm -A`{{execute}}

Yes, since there are no type restrictions any attribute can be added to the spec.

Next, let's add a schema to the CRD using the open API v3 Schema. The following schema has the _validation_ section added.

`ccat thermometer-with-validation-crd.yaml`{{execute}}

See see the validation work, delete the current CRD definition.

`kubectl delete crd  --all`{{execute}}

and apply the expanded CRD that contains the validation.

`kubectl apply -f thermometer-with-validation-crd.yaml`{{execute}}

Try reapplying the Gothenburg Thermometer declaration again.

`kubectl apply -f gothenburg-thermometer.yaml`{{execute}}

Try Stockholm manifest again.

`kubectl apply -f stockholm-thermometer.yaml`{{execute}}

Both thermometer resource declarations now fail because the attributes in the spec sections not longer meet the schema type requirements.
