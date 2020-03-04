Try the following to inspect all the API major commands.

`kubectl get --raw /`{{execute}}

List the namespaces.

`kubectl get --raw /api/v1/namespaces`{{execute}}

`kubectl get --raw /api/v1/namespaces/default`{{execute}}

```
kubectl get --raw /api/v1/namespaces/default/ 
{"kind":"Namespace","apiVersion":"v1","metadata":{"name":"default","selfLink":"/api/v1/namespaces/default","uid":"288cb0cf-4257-4288-9863-d313bc502972","resourceVersion":"146","creationTimestamp":"2020-02-02T03:15:52Z"},"spec":{"finalizers":["kubernetes"]},"status":{"phase":"Active"}}
```{{execute}}

There is a common Linux tool called `jq`. jq is like sed for JSON data. Using `jq` can make the JSON output from `kubectl` much easier to read with syntax highlighting.

`kubectl get --raw /api/v1/namespaces/default | jq .`{{execute}}

There is also a Python json.tool.

`kubectl get -v=9 --raw /api/v1/namespaces/default | python -m json.tool`{{execute}}

Notice in the last command we added a [verbosity request](https://kubernetes.io/docs/reference/kubectl/cheatsheet/#kubectl-output-verbosity-and-debugging) `-v=9`. With it set to level 9 (highest) we get a bit more insight into how the `kubectl` command is obtaining the returned information.
