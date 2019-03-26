Deploy Kibana. The service will be on a NodePort at 31000.

`helm install stable/kibana --name=kibana --namespace=logs --set env.ELASTICSEARCH_URL=http://elasticsearch-client:9200 --set service.type=NodePort --set service.nodePort=31000`{{execute}}

> Security caution. This NodePort exposes the logging to the outside world intentionally for demonstration purposes. However, for production Kubernetes clusters never expose the Kibana dashboard service to the world without any authentication.
