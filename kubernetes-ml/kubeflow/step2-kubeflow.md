You also have a Kubeflow platform and available for experimentation. It's components have been installed.

`kubectl get pods --namespace kubeflow`{{execute}}

There are several new Custom Resource Definitions (CRDs) that have been installed on behalf of the Kubeflow Operator.

`kubectl get crds`{{execute}}

The standard command line tool for Kubeflow, `kfctl` is also available.

`kfctl version`{{execute}}

The [Kubeflow dashboard](https://[[HOST_SUBDOMAIN]]-31380-[[KATACODA_HOST]].environments.katacoda.com/) is also available.
