<img align="right" src="./assets/fluentbit.png" width="150">
[Fluent Bit](https://fluentbit.io/) is an open source specialized data collector. It provides built-in metrics and general purpose output interfaces for centralized collectors such as Fluentd.
Create the configuration for Fluent Bit.

Install Fluent Bit and pass the ElasticSearch service endpoint as a chart parameter. This chart will install a DaemonSet that will start a Fluent Bit pod on each node. With this, each Fluent Bit service will collect the logs from each node and stream it to ElasticSearch.

Add the chart repository for the Helm chart to be installed.

`helm repo add fluent https://fluent.github.io/helm-charts`{{execute}}
`helm repo add stable https://kubernetes-charts.storage.googleapis.com`{{execute}}

Install the chart.
 
`helm install fluent-bit fluent/fluent-bit \
  --version 0.6.1 \
  --namespace=logs`{{execute}}

`helm install fluent-bit stable/fluent-bit \
  --version 2.10.0 \
  --set backend.type=es \
  --set backend.es.time_key="@hackout-timestamp" \
  --set backend.es.host=elasticsearch-master \
  --namespace=logs`{{execute}}

Fluent Bit is starting and will become available in a few moments. In the meantime, continue to the next installation step.
