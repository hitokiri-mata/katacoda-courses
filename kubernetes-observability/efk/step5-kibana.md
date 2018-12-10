Deploy Kibana

`helm install --name kibana stable/kibana \
    --set env.ELASTICSEARCH_URL=http://elasticsearch:9200 \
    --set image.tag=6.4.2 \
    --namespace logging`{{execute}}

## Port Adjustment ##

The chart lacks the ability to set the nodePort value for the service exposed as a NodePort. Instead, patch the service to change the random port to a known port.

`kubectl patch service kibana --namespace logging --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":31001}]'`{{execute}}

With this, the Kibana service is assigned to a known port, 31001.

`kubectl get service kibana-efk-cluster --namespace logging`{{execute}}

Verify Kibana is starting up.

`helm list`{{execute}}

`kubectl get pods,services -n logging`{{execute}}

