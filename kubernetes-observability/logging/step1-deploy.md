# Deploy #

Ensure Minikube is running and ready to accept your upcoming declarations.

`minikube status`{{execute}}

The examples charts are defined in a [Alen Komljen's GitHub repository](https://github.com/komljen). Add this repo to Helm.

`helm repo add akomljen-charts https://raw.githubusercontent.com/   /helm-charts/master/charts/`{{execute}}

The [Operator pattern](https://kubernetes.io/docs/concepts/extend-kubernetes/extend-cluster/#combining-new-apis-with-automation) is helpful in Kubernetes and Alen Komljen took a good approach to use an operator for this solution. Add the ElasticSearch operator.

`helm install --name es-operator --namespace logging akomljen-charts/elasticsearch-operator`{{execute}}

In a moment, verify the operator is up and running.

`kubectl get pods -n logging`{{execute}}

With the operator a new customer resource definition (crd) has been added to extend the Kubenretes resource model to include the resource kind called `TODO`.

`kubectl get CustomResourceDefinition`{{execute}}

With these operator prerequisites the EFK stack can now be deployed with a single umbrella Helm chart.

`helm install --name efk --namespace logging akomljen-charts/efk --set kibana.service.type=NodePort`{{execute}}

Six pods will soon be running in the logging namespace.

`kubectl get pods -n logging`{{execute}}

The chart lacks the ability to set the nodePort valued for the service exposed as a NodePort. Instead patch the service to change the random port to a known port.

`kubectl patch service kibana-efk-cluster --namespace logging --type='json' --patch='[{"op": "replace",  "path": "/spec/ports/0/nodePort", "value":31001}]'`{{execute}}

With this the Kibana service is a known port, 31001.

`minikube service kibana-efk-cluster --namespace logging --url`{{execute}}

 Because of Katacoda's virtualization you cannot address this URL from your browser, but you can use Katacoda's domain as the URL to the same service. Notice the same port number placed in the subdomain of the URL.

`curl -s https://[[HOST_SUBDOMAIN]]-31001-[[KATACODA_HOST]].environments.katacoda.com/`{{execute}}

There is also a top above the command line area labeled `Kibana` that takes you to the same Kibana portal.
