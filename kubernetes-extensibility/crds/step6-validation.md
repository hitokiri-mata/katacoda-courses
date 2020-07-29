Let's try a new Thermometer resource that defines a different city, such as:

`ccat gothenburg-thermometer.yaml`{{execute}}

Will it successfully apply?

`kubectl apply -f gothenburg-thermometer.yaml`{{execute}}

Get all the current Thermometers.

`kubectl get trm -A`{{execute}}

Next, let's add a schema to the CRD using open API v3 Schema. The following schema has the validation section added.

`ccat thermometer-with-validation-crd.yaml`{{execute}}

Delete the associated CRDs.

`kubectl delete crd  --all`{{execute}}

and reapply the CRD that contains the validation.

`kubectl apply -f thermometer-with-validation-crd.yaml`{{execute}}

Try reapplying the Gothenburg Thermometer declaration again.

`kubectl apply -f gothenburg-thermometer.yaml`{{execute}}

Try Stockholm manifest again.

`kubectl apply -f stockholm-thermometer.yaml`{{execute}}
