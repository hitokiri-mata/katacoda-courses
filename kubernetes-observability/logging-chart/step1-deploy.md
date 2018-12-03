# Deploy EFK #

Ensure Minikube is running and ready to accept your upcoming declarations.

`minikube status`{{execute}}

## Add Chart Repository ##

The examples charts are defined in a [Alen Komljen's GitHub repository](https://github.com/komljen). Add this repo to Helm.

`helm repo add akomljen-charts https://raw.githubusercontent.com/komljen/helm-charts/master/charts/`{{execute}}

## Add ElasticSearch Operator ##

The [Operator pattern](https://kubernetes.io/docs/concepts/extend-kubernetes/extend-cluster/#combining-new-apis-with-automation) is helpful in Kubernetes and Alen Komljen took a [good approach to use an operator](https://akomljen.com/kubernetes-elasticsearch-operator/) for this solution. Add the [ElasticSearch operator](https://github.com/komljen/helm-charts/tree/master/elasticsearch-operator).

`helm install --name es-operator --namespace logging akomljen-charts/elasticsearch-operator --set rbac.create=false`{{execute}}

In a moment, verify the operator is up and running.

`kubectl get pods -n logging`{{execute}}

With the operator a new customer resource definition (crd) has been added to extend the Kubernetes resource model to include the resource kind called _ElasticsearchCluster_`.

Inspect the _crd_.

`kubectl get CustomResourceDefinition`{{execute}}

`kubectl describe CustomResourceDefinition elasticsearchclusters.enterprises.upmc.com`{{execute}}

## Install EFK ##

With these operator prerequisites the EFK stack can be deployed with a single umbrella Helm chart.

`helm install --name efk --namespace logging akomljen-charts/efk --set kibana.service.type=NodePort --set fluent-bit.rbac.create=false --set elasticsearch.javaOpts="-Xms256m -Xmx256m" --set elasticsearch.resources.requests.memory=256Mi --set elasticsearch.resources.limits.memory=512Mi`{{execute}}

Above, RBAC was disabled for simplicity of this demo and the memory settings were lowered to fit inside the Katacoda small minikube server size.

The stack of pods will soon be running in the logging namespace.

`kubectl get pods -n logging`{{execute}}

Wait about 3 minutes until **all six pods** reach the _Running_ status.

The chart lacks the ability to set the nodePort valued for the service exposed as a NodePort. Instead, patch the service to change the random port to a known port.

`kubectl patch service efk-kibana --namespace logging --type='json' --patch='[{"op": "replace",  "path": "/spec/ports/0/nodePort", "value":31001}]'`{{execute}}

With this the Kibana service is assigned to a known port, 31001.

`minikube service kibana-efk-cluster --namespace logging --url`{{execute}}

The next step will start a simple application that generates some logs. A subsequent step will explore Kibana.
