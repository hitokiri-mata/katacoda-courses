# Install OpenFaaS #

Now that the namespaces are present, OpenFaaS can be installed using Helm. Helm is a package manager for Kubernetes that was previously installed and ready for instructions.

A common Helm _chart_ is predefined for installing OpenFaaS. Popular incubating and stable charts appear in the [curated Helm chart repository](https://github.com/kubernetes/charts) and there are plans to move OpenFaaS there. For now, a `repo add` command will allow Helm to find the OpenFaaS chart

`helm repo add openfaas https://openfaas.github.io/faas-netes/`{{execute}}

Install the OpenFaaS operator chart found in that repo

`helm upgrade openfaas --install openfaas/openfaas --namespace openfaas --set basic_auth=true --set functionNamespace=openfaas-fn --set operator.create=true --set rbac=false`{{execute}}

Watch the 5 deployments for OpenFaaS become _Available_. The _Available_ status column turns from 0 to 1 once each deployment has initialized.

`kubectl --namespace=openfaas get deployments -l "release=openfaas, app=openfaas -w"`{{execute}}

The installation is complete once all the Deployments have reached an _Available_ state of 1, press Ctrl-C to break out of the watch.

These instructions have been adopted from the [openfaas-operator](https://github.com/openfaas-incubator/openfaas-operator).