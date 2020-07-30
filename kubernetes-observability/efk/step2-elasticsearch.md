<img align="right" src="./assets/elasticsearch.png" width="150">
[Elasticsearch](https://github.com/elastic/elasticsearch) is a RESTful search engine based on the Lucene library. It provides a distributed, multitenant-capable full-text search engine with an HTTP web interface and schema-free JSON documents. Elasticsearch is open source and developed in Java.

Create a namespace for the installation target.

`kubectl create namespace logs`{{execute}}

Add the chart repository for the Helm chart to be installed.

`helm repo add elastic https://helm.elastic.co`{{execute}}

Deploy the public Helm chart for ElasticSearch. The chart's default settings are appropriately opinionated for production deployment. Here, some of the default settings are downsized to fit in this Katacoda cluster.

`helm install elasticsearch elastic/elasticsearch \
--version=7.8.1 \
--namespace=logs \
-f elastic-values.yaml`{{execute}}

ElasticsSearch is starting and will be available in a few moments. In the meantime, move to the next installation step.
