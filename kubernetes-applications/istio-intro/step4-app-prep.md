## Deploy Katacoda Service

To make the sample Bookinfo application and dashboards available to the outside world, in particular, on Katacoda, deploy the following YAML.

`kubectl apply -f /root/katacoda.yaml`

Without this, the Bookinfo example and other dashboards will not be available.

## Injection label

Prior to the Bookinfo install, add a namespace label to instruct Istio to automatically inject Envoy sidecar proxies when you deploy the Bookinfo application into this namespace.

`kubectl label namespace default istio-injection=enabled`{{execute}}

There are other methods to inject the Envoy sidecar, but this technique works well as a pre-installation step for a namespace.
