Because of Katacoda's virtualization you cannot address this URL from your browser, but you can use Katacoda's domain as the URL to the same service. Notice the same port number placed in the subdomain of the URL.

[View Kibana](https://[[HOST_SUBDOMAIN]]-31001-[[KATACODA_HOST]].environments.katacoda.com/)

There is also a top above the command line area labeled `Kibana` that takes you to the same Kibana portal.

---- 

In Kibana:

Configure the index with logstash* using @timestamp as the Time field filter.

Go to Discover and you can now add your custom filters and see the logs.

These steps were interpreted from John Bryan Sazon's article on [Getting started with EFK (Fluent Bit, Elasticsearch and Kibana) stack in Kubernetes](https://medium.com/@jbsazon/aggregated-kubernetes-container-logs-with-fluent-bit-elasticsearch-and-kibana-5a9708c5dd9a)"

The screen should appear like the ones in the article.
