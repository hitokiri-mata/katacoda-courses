Create a namespace for the EFK stack.

`kubectl create namespace logging`{{execute}}

Deploy ElasticSearch

`kubectl run elasticsearch -n logging --image=docker.elastic.co/elasticsearch/elasticsearch:6.3.2`{{execute}}

Verify ElasticsSearch is starting up. It may take a minute or two to start.

`kubectl get pods,services -n logging`{{execute}}

Once it reaches the running state, expose the port.

`kubectl expose deploy elasticsearch -n logging --port 9200`{{execute}}
