Deploy Kibana. The service will be on a NodePort at 31000.

`helm install kibana elastic/kibana \
  --version=7.8.1 \
  --namespace=logs \
  --set service.type=NodePort \
  --set service.nodePort=31000`{{execute}}

> Security caution. This NodePort exposes the logging to the outside world intentionally for demonstration purposes. However, for production Kubernetes clusters never expose the Kibana dashboard service to the world without any authentication.

Kibana is starting and will become available in a few minutes.
