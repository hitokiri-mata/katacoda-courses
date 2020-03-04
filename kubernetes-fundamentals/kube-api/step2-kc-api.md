Try the following to inspect all the API major commands.

`kubectl get --raw /`{{execute}}

List the namespaces.

`kubectl get --raw /api/v1/namespaces`

`kubectl get --raw /api/v1/namespaces/default`

```
kubectl get --raw /api/v1/namespaces/default/ 
{"kind":"Namespace","apiVersion":"v1","metadata":{"name":"default","selfLink":"/api/v1/namespaces/default","uid":"288cb0cf-4257-4288-9863-d313bc502972","resourceVersion":"146","creationTimestamp":"2020-02-02T03:15:52Z"},"spec":{"finalizers":["kubernetes"]},"status":{"phase":"Active"}}
```

**tip:** `jq` or `python json.tool` can make this easier to read.
`k get --raw /api/v1/namespaces/default | jq .` or
`k get --raw /api/v1/namespaces/default | python -m json.tool`