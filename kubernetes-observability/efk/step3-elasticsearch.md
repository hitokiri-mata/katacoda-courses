Create a namespace for the EFK stack.

`kubectl create namespace logging`{{execute}}

Deploy ElasticSearch

`kubectl run elasticsearch -n logging --image=docker.elastic.co/elasticsearch/elasticsearch:6.3.2`{{execute}}

`kubectl expose deploy elasticsearch -n logging --port 9200`{{execute}}

Verify ElasticsSearch is starting up.

`kubectl get pods,services -n logging`{{execute}}
