

`export ADDRESS=$(kubectl get node  --output 'jsonpath={.items[0].status.addresses[0].address}'):$(kubectl get svc knative-ingressgateway --namespace istio-system   --output 'jsonpath={.spec.ports[?(@.port==80)].nodePort}')`{{execute}}

`export SERVICE=$(kubectl get ksvc helloworld-go  --output jsonpath='{.status.domain}')`{{execute}}

`echo Service $SERVICE is at $ADDRESS`{{execute}}

`curl -v -H "Host: $SERVICE" http://$ADDRESS`{{execute}}