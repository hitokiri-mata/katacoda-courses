## Deploy Katacoda Service

To make the sample BookInfo application and dashboards available to the outside world, in particular, on Katacoda, deploy the following Yaml

`kubectl apply -f /root/katacoda.yaml`{{execute}}

Without this, the bookInfo example and other dashboards will not be available.

## Injection label

Prior to installing, add a namespace label to instruct Istio to automatically inject Envoy sidecar proxies when you deploy the BookInfo application into this namespace.

`kubectl label namespace default istio-injection=enabled`{{execute}}

There are other methods to inject the Envoy sidecar, but this technique works well as a pre-installation step for a namespace.
