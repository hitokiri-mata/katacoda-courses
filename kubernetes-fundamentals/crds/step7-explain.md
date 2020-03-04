6. Explaining CRDs

In the CRD manifest, define the following just after `scope: Namespaced`

```yaml
  scope: Namespaced
  preserveUnknownFields: false
```

The `preserveUnknownFields` is not needed for CRD v1, but it is needed for v1beta1.  The combination of this field set to false AND the defined schema enables the `k explain` such as:

```bash
k explain therm --recursive
KIND:     Thermometer
VERSION:  d2iq.com/v1

DESCRIPTION:
     Thermometer is the Schema for the Thermometer API.

FIELDS:
   apiVersion	<string>
   kind	<string>
   metadata	<Object>
      annotations	<map[string]string>
      clusterName	<string>
      creationTimestamp	<string>
      deletionGracePeriodSeconds	<integer>
      deletionTimestamp	<string>
      finalizers	<[]string>
      generateName	<string>
      generation	<integer>
      labels	<map[string]string>
      managedFields	<[]Object>
         apiVersion	<string>
         fieldsType	<string>
         fieldsV1	<map[string]>
         manager	<string>
         operation	<string>
         time	<string>
      name	<string>
      namespace	<string>
      ownerReferences	<[]Object>
         apiVersion	<string>
         blockOwnerDeletion	<boolean>
         controller	<boolean>
         kind	<string>
         name	<string>
         uid	<string>
      resourceVersion	<string>
      selfLink	<string>
      uid	<string>
   spec	<Object>
      unit	<string>
   status	<Object>
      temperature	<number>
```
