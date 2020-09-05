Now that the Bookinfo services are up and running, we'll open a few forms of access to the application. Some of the service access techniques are private to the cluster, but we'll progress outward and open a public ingress path. 

## Private, Internal Access

Once running, the application's product page can be accessed internally to the cluster. This technique is accessing services through the ClusterIP:

```bash
kubectl exec -it $(kubectl get pod -l app=ratings -o jsonpath='{.items[0].metadata.name}') \
  -c ratings \
  -- curl productpage:9080/productpage | grep -o "<title>.*</title>" && echo
```{{execute}}

You will see `<title>Simple Bookstore App</title>`.

## Mesh Gateway

For all your services in a mesh, the main point of access is the  
To make the sample Bookinfo application to the outside world on this Katacoda scenario, deploy the following YAML.

An Istio Gateway is used to define the ingress into the mesh.

Define the ingress gateway for the application:

`kubectl apply -f istio-$ISTIO_VERSION/samples/bookinfo/networking/bookinfo-gateway.yaml`{{execute}}

Confirm the gateway has been created:

`kubectl get gateway`{{execute}}

`kubectl describe gateway`{{execute}}

Determining the ingress IP and ports and set the INGRESS_HOST and INGRESS_PORT variables for accessing the gateway. Return here, when they are set.

Get the ingress gateway service host IP and port:

`export INGRESS_HOST=$(kubectl get po -l istio=ingressgateway -n istio-system -o jsonpath='{.items[0].status.hostIP}') && echo $INGRESS_HOST`{{execute}}

`export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}') && echo $INGRESS_PORT`{{execute}}

Formulate the URL:

`export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT && echo $GATEWAY_URL`{{execute}}

Confirm the app is accessible from outside the cluster:

The curl command above to verify access to the page, was done internal to the cluster through the cluster IP of the service. Now we can test the same access via the ingress.

`curl -s http://${GATEWAY_URL}/productpage | grep -o "<title>.*</title>"`{{execute}}

Again, you will see `<title>Simple Bookstore App</title>`.

The full application web interface is now available at this public Katacoda address at:

https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/productpage

## Ingress Service Connection to the Mesh Gateway

For public access the cloud systems load balancer needs to know where to send traffic. The istio-ingressgateway is a Pod with a Service of the type _LoadBalancer_ that accepts this traffic. Currently the _external ip_ is stuck a pending which means there is no bridge between the Katacoda load balancer and this scenario's ingress gateway service:

`kubectl get service istio-ingressgateway -n istio-system`{{execute}}

Notice the `EXTERNAL-IP` reports `<pending>`.

The IP where the ingressgateway is exposed is the master node at [[HOST_IP]]. To connect this bridge, add this IP as the `externalIP` to the _istio-ingressgateway_ Service using the patch command:

`kubectl patch service -n istio-system istio-ingressgateway -p '{"spec": {"type": "LoadBalancer", "externalIPs":["[[HOST_IP]]"]}}'`{{execute}}

When ready, it will show a status close to this.

```bash
NAME                   TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)                         AGE
istio-ingressgateway   LoadBalancer   10.103.192.174   [[HOST_IP]]      15021:31042/TCP,80:30136/TCP,443:32460/TCP,31400:31798/TCP,15443:30927/TCP   6m51s
```

## Apply default destination rules

Before you can use Istio to control the Bookinfo version routing, the destination rules need to define  the available versions, called subsets.

Create the default destination rules for the Bookinfo services:

`kubectl apply -f istio-$ISTIO_VERSION/samples/bookinfo/networking/destination-rule-all.yaml`{{execute}}

View the destination rules:

`kubectl get destinationrules`{{execute}}

There are rules for each service. For example, the rules for seeing the different review pages are this:

`kubectl get destinationrules reviews -o yaml | grep -B2 -A20 "host: reviews"`{{execute}}
