<img align="right" src="./assets/fluentbit.png" width="150">
[FluentBit](https://fluentbit.io/) is an open source specialized data collector. It provides built-in metrics and general purpose output interfaces for centralized collectors such as Fluentd.
Create the configuration for Fluent Bit.

Install Fluent Bit and pass the ElasticSearch service endpoint as a chart parameter. This chart will install a DaemonSet that will start a Fluent Bit pod on each node. With this, each Fluent Bit service will collect the logs from each node and stream it to ElasticSearch.

Add the chart repository for the Helm chart to be installed.

`helm repo add stable https://kubernetes-charts.storage.googleapis.com`{{execute}}

Install the chart.

`helm install fluent-bit stable/fluent-bit \
  --version=2.10.0 \
  --namespace=logs \
  --set backend.type=es \
  --set backend.es.host=elasticsearch-master`{{execute}}

Fluent Bit is starting and will become available in a few moments. In the meantime, move onto the next installation step.
