Just as objects in programming languages can have attributes, a resource can also have typed attributes. When you request information about a resource or list of resources, these attributes can be revealed. In the previous example, the Thermometer CRD defined some data, but they cannot be easily revealed. You can add an  [additionalPrinterColumns](https://kubernetes.io/docs/tasks/access-kubernetes-api/custom-resources/custom-resource-definitions/#additional-printer-columns) section to define extra output fields.

A new CRD definition includes the `additionalPrinterColumns` section:

`ccat thermometer-crd-with-columns.yaml`{{execute}}

See how two new columns are defined under the `.versions.additionalPrinterColumns:` group. There is also a schema section that is minimally defined. Apply this new CRDs declaration for the Thermometers:

`kubectl apply -f thermometer-crd-with-columns.yaml`{{execute}}

Now, see the new columns `Unit` and `Temperature` appear:

`kubectl get trm -A`{{execute}}

Notice the value for `Unit` does not appear. This is because the values were pruned when the resource was first applied. Next, let's explore validation to get the values to appear.
