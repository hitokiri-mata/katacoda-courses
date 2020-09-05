Now that the Bookinfo services are up and running, we'll open a public gateway to the application. 

## Deploy Katacoda Service

To make the sample Bookinfo application and dashboards available to the outside world on this Katacoda scenario, deploy the following YAML.

## Ingress Service Connection to the Mesh Gateway

For outside access, an important service is the istio-ingressgateway. The EXTERNAL-IP is set to the IP of the master Node.

`kubectl cluster-info | grep master`{{execute}}

Verify the EXTERNAL-IP is set to the Kubernetes master host IP.

`kubectl get service istio-ingressgateway -n istio-system`{{execute}}

When ready, it will show a status close to this.

```bash
NAME                   TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)                         AGE
istio-ingressgateway   LoadBalancer   10.103.192.174   172.17.0.36   15021:31042/TCP,80:30136/TCP,443:32460/TCP,31400:31798/TCP,15443:30927/TCP   6m51s
```

## Mesh Gateway

An Istio Gateway is used to define the ingress into the mesh.

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

Before you can use Istio to control the Bookinfo version routing, you need to define the available versions, called subsets, in destination rules.

Create the default destination rules for the Bookinfo services:

`kubectl apply -f istio-$ISTIO_VERSION/samples/bookinfo/networking/destination-rule-all.yaml`{{execute}}

View the destination rules:

`kubectl get destinationrules`{{execute}}

There are rules for each service. For example, the rules for seeing the different review pages are this:

`kubectl get destinationrules reviews -o yaml | grep -B2 -A20 "host: reviews"`{{execute}}


