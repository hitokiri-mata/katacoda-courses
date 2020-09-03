<img align="right" src="./assets/kibana.png" width="150">
[Kibana](https://www.elastic.co/kibana) is a free and open user interface that lets you visualize your Elasticsearch data and navigate the Elastic Stack. Do anything from tracking query load to understanding the way requests flow through your apps.

Deploy Kibana. The service will be on a NodePort at 31000.

`helm install kibana elastic/kibana \
  --version=7.9.0 \
  --namespace=logs \
  --set service.type=NodePort \
  --set service.nodePort=31000`{{execute}}

> Security caution. This NodePort exposes the logging to the outside world intentionally for demonstration purposes. However, for production Kubernetes clusters never expose the Kibana dashboard service to the world without any authentication.

Kibana is starting and will become available in a few minutes.
