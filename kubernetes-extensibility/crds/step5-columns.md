Just as objects in programming languages can have attributes, a resource can also have typed attributes. When you request information about a resource or list of resources these attributes can be revealed. In the previous example, the Thermometer CRD defined some data, but they cannot be easily revealed. You can add an  [additionalPrinterColumns](https://kubernetes.io/docs/tasks/access-kubernetes-api/custom-resources/custom-resource-definitions/#additional-printer-columns) section to define extra output fields.

A new CRD definition includes the `additionalPrinterColumns` section.

`ccat thermometer-crd-with-columns.yaml`{{execute}}

See how two new columns are defined under the `.versions.additionalPrinterColumns:` group. There is also a schema section that is minimally defined. Apply this new CRDs declaration for the thermometers.

`kubectl apply -f thermometer-crd-with-columns.yaml`{{execute}}

Now, see the new columns `Unit` and `Temperature` appear.

`kubectl get trm -A`{{execute}}

The value for `Unit` appears as it's in the definition. The value `example: 'not printed'` does not appear since it's not a selection for a column. The temperatures are blank because this is intended to be filled in by an application. Brilliant.

Next, let's explore validation.
