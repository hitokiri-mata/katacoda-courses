

`export ADDRESS=$(kubectl get node  --output 'jsonpath={.items[0].status.addresses[0].address}'):$(kubectl get svc knative-ingressgateway --namespace istio-system   --output 'jsonpath={.spec.ports[?(@.port==80)].nodePort}')`{{execute}}

`export SERVICE=$(kubectl get ksvc helloworld-go  --output=custom-columns=NAME:.metadata.name,DOMAIN:.status.domain)`{{execute}}

`curl "$SERVICE" http://$ADDRESS`{{execute}}