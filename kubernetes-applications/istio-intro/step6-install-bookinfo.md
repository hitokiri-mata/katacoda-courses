Next, you will install a demonstration application called Bookinfo. The application is composed of several microservices and they will all be deployed to the _default_ namespace.

## Start Bookinfo application

Install the Bookinfo application.

`kubectl apply -f istio-$ISTIO_VERSION/samples/bookinfo/platform/kube/bookinfo.yaml`{{execute}}

This YAML file contains all the declarative manifests for the deployments, pods, services that define the application. There is nothing in the YAML or within the application containers that exhibit knowledge or requirements for Istio to be present. The mesh is always independent from your application configuration and logic.

In a few moments, the Bookinfo components will be running.

`kubectl get deployments,pods,services`{{execute}}

Once running, the application's product page can be accessed internally.

```bash
kubectl exec -it $(kubectl get pod -l app=ratings -o jsonpath='{.items[0].metadata.name}') \
  -c ratings \
  -- curl productpage:9080/productpage | grep -o "<title>.*</title>"
```{{execute}}

You will see `<title>Simple Bookstore App</title>`.

## Ingress gateway

Define the ingress gateway to open public traffic to the application.

`kubectl apply -f samples/bookinfo/networking/bookinfo-gateway.yaml`{{execute}}

Confirm the gateway is available.

`kubectl describe gateway`{{execute}}

Istio should also report no issues.

`istioctl analyze`{{execute}}

## Confirm access

Get the ingress gateway host IP.

`export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.externalIPs[0]}')`{{execute}}

Set the ingress port.

`export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')`{{execute}}

Formulate the URL.

`export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT && echo $GATEWAY_URL`{{execute}}

The curl command above to verify access to the page, was done internal to the cluster through the cluster IP of the service. Now we can test the same access via the ingress.

`curl -s http://${GATEWAY_URL}/productpage | grep -o "<title>.*</title>"`{{execute}}

Again, you will see `<title>Simple Bookstore App</title>`.

The full application web interface is now available at this public Katacoda address at:

https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/productpage

## Apply default destination rules

Before you can use Istio to control the Bookinfo version routing, you need to define the available versions, called subsets, in destination rules.

`kubectl apply -f samples/bookinfo/networking/destination-rule-all.yaml`{{execute}}
