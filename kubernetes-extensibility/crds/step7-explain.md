The `kubectl explain` command help reveal a resource's schema in a readable form. For instance, any standard resource will show helpful links to the online documentation for the various fields.

`kubectl explain namespace`{{execute}}

Inside your CRD definition, you can also provide text to explain schemas for fields.

With the current CRD, the `Explain` command will not work.

`kubectl explain thermometer`{{execute}}

The descriptions in the schema section allow the `Explain` command to present documentation text and links.

The `Explain` command reveals details about the resource definition.

`kubectl explain thermometer`{{execute}}

There are a few more features in the CRD definition, but this scenario covers most of the ideas, specifically about defining a schema for the data. You can reinforce what you just learned at the documentation page for [Extend the Kubernetes API with CustomResourceDefinitions](https://kubernetes.io/docs/tasks/extend-kubernetes/custom-resources/custom-resource-definitions).
