Create a namespace for the EFK stack.

`kubectl create namespace logging`{{execute}}

Deploy ElasticSearch

`kubectl run elasticsearch -n logging --image=docker.elastic.co/elasticsearch/elasticsearch:6.3.2`{{execute}}

`kubectl expose deploy elasticsearch --port 9200`{{eecute}}

Verify ElasticsSearch is starting up.

`kubectl get pods,services -n logging`{{execute}}
