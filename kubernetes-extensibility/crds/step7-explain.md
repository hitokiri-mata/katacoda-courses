With the current CRD, the `Explain` command will not work.

`kubectl explain thermometer`{{execute}}

An additional change to the schema allows the `Explain` command to work. Notice in this CRD definition the added setting `preserveUnknownFields` on line 15 is set to false.

`ccat thermometer-with-validation-crd.yaml | cat -n -`{{execute}}

Apply this CRD.

`kubectl apply -f thermometer-with-validation-crd.yaml`{{execute}}

Now the `Explain` command reveals details about the resource definition.

`kubectl explain thermometer`{{execute}}

The `preserveUnknownFields` is not needed for CRD v1, but it is needed for v1beta1. The combination of this field set to false AND the defined schema enables the `k explain` such as:
