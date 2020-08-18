Install Prometheus and Grafana for metrics:

`kubectl apply --filename https://github.com/knative/serving/releases/download/v${KNATIVE_VERSION}/monitoring-metrics-prometheus.yaml`{{execute}}

Install the ELK stack (Elasticsearch, Logstash and Kibana) for logs:

`kubectl apply --filename https://github.com/knative/serving/releases/download/v${KNATIVE_VERSION}/monitoring-logs-elasticsearch.yaml`{{execute}}

To install the in-memory (standalone) version of Jaeger, run the following command:

`kubectl apply --filename https://github.com/knative/serving/releases/download/v${KNATIVE_VERSION}/monitoring-tracing-jaeger-in-mem.yaml`{{execute}}

It will take a few moments to start.

`kubectl get deployments,pods,services --namespace knative-monitoring`{{execute}}
