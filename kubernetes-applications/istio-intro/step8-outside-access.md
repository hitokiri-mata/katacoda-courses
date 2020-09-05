Now that the BookInfo services are up and running, we'll open a public gateway to the application. An Istio Gateway is used to define this ingress.

Define the ingress gateway for the application:

`kubectl apply -f istio-$ISTIO_VERSION/samples/bookinfo/networking/bookinfo-gateway.yaml`{{execute}}

Confirm the gateway has been created:

`kubectl get gateway`{{execute}}

Determining the ingress IP and ports and set the INGRESS_HOST and INGRESS_PORT variables for accessing the gateway. Return here, when they are set.

`export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')`{{execute}}

`export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].nodePort}')`{{execute}}

`export INGRESS_HOST=$(kubectl get po -l istio=ingressgateway -n istio-system -o jsonpath='{.items[0].status.hostIP}')`{{execute}}

Set GATEWAY_URL: 

`export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT`{{execute}}

## Confirm the app is accessible from outside the cluster:

`curl -s http://${GATEWAY_URL}/productpage | grep -o "<title>.*</title>"`{{execute}}

https://2886795324-80-frugo01.environments.katacoda.com/productpage

## Apply default destination rules

Before you can use Istio to control the BookInfo version routing, you need to define the available versions, called subsets, in destination rules.

Create the default destination rules for the BookInfo services:

`kubectl apply -f istio-$ISTIO_VERSION/samples/bookinfo/networking/destination-rule-all.yaml`{{execute}}

View the destination rules:

`kubectl get destinationrules`{{execute}}

There are rules for each service. For example, the rules for seeing the different review pages are this:

`kubectl get destinationrules reviews -o yaml | grep -B2 -A20 "host: reviews"`{{execute}}


