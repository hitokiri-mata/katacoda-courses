The recommended way to start Litmus is by installing the Litmus Operator. A single YAML file has several manifests that include the namespace creation, custom resource definitions (CRDs), service account configuration, and deployments for the Litmus Operator. Install all this with a single command: 

`kubectl apply -f https://litmuschaos.github.io/litmus/litmus-operator-v1.8.0.yaml`{{execute}}

The command installs:

<span style="color:green">**Expected Output**</span>

```bash
namespace/litmus created
serviceaccount/litmus created
clusterrole.rbac.authorization.k8s.io/litmus created
clusterrolebinding.rbac.authorization.k8s.io/litmus created
deployment.apps/chaos-operator-ce created
customresourcedefinition.apiextensions.k8s.io/chaosengines.litmuschaos.io created
customresourcedefinition.apiextensions.k8s.io/chaosexperiments.litmuschaos.io created
customresourcedefinition.apiextensions.k8s.io/chaosresults.litmuschaos.io created
```

Check the available namespaces and see if `litmus` is present:

`kubectl get namespaces`{{execute}}

In the list, you will see `litmus` as a namespace that you just created.
