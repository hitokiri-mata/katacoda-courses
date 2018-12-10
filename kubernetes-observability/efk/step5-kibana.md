Deploy Kibana

`helm install --name kibana stable/kibana \
    --set env.ELASTICSEARCH_URL=http://elasticsearch:9200 \
    --set image.tag=6.5.1 \
    --set service.type=NodePort \
    --set service.nodePort=31001 \
    --namespace logging`{{execute}}

With this, the Kibana service is assigned to a known port, 31001.

`kubectl get service kibana --namespace logging`{{execute}}

Verify Kibana is starting up.

`helm list`{{execute}}

`kubectl get pods,services -n logging`{{execute}}
