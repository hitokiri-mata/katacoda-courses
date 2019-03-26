Create the configuration for Fluentd.

Install fluent-bit and pass the ElasticSearch service endpoint as a chart parameter. This chart will install a DaemonSet that will start a Fluent Bit pod on each node. With this each Fluent Bit services will collects the logs from each node and stream it to ElasticSearch.

`helm install stable/fluent-bit --name=fluent-bit --namespace=logs --set backend.type=es --set backend.es.host=elasticsearch-client`{{execute}}