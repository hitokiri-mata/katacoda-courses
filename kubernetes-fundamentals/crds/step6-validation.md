Let's try a new Thermometer resourse that defines a different city, such as:

`cat gothenburg-thermometer.yaml`{{execute}}

Will it successfully apply?

`kubectl create -f gothenburg-thermometer.yaml`{{execute}}

Get all the current Thermometers.

`kubectl get trm -A`{{execute}}

Next, let's add a schema to the CRD using open API v3 Schema. The following schema has the validation section added.

`cat thermometer-with-validation-crd.yaml`{{execute}}

Delete the associated CRDs.

`kubectl delete crd  --all`

and reapply the CRD that contains the validation.

`kubectl apply -f thermometer-with-validation-crd.yaml`{{execute}}

Try reapplying the Gothenburg Thermometer declaration again.

`kubectl apply -f gothenburg-thermometer.yaml`{{execute}}

Try Stockholm manifest again.

`kubectl apply -f stokholm-thermometer.yaml`{{execute}}
