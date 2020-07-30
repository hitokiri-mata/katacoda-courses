In your current directory, there is a YAML file for a thermometer for Stockholm Sweden.

`ccat stockholm-thermometer.yaml`{{execute}}

Notice the YAML has the name and namespace (as the location) and units defined. Create the namespace.

`kubectl create namespace sweden`{{execute}}

Apply the new resource declaration.

`kubectl apply -f stockholm-thermometer.yaml`{{execute}}

Get the resource information.

`kubectl get trm -A`{{execute}}

This is as expected and consistent with the previous example. However, this thermometer YAML has extra data declared.  

```yaml
    unit: Celsius
    example: 'not printed'
```

The CRD controller will actively prune any unknown data that is not defined in the schema. This pruning behavior is welcomed as want to strip out any unknown data to lessen accidental or nefarious data getting into our cluster. We'll get into better schema validation in a moment. You can verify the data was pruned by inspecting the resource.

`kubectl get trm stockholm -n sweden -o json | jq`{{execute}}

Wouldn't it be nice if the displayed output from the `get` command included the additional information defined in the resource details? In the next step, you can define the extra columns then improve the schema.
