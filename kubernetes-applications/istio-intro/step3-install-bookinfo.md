Next, you will install a demonstation application called Book info. The application is composed of several microservices and they will all be deployed to the _default_ namespace.  

Prior to installing, add a namespace label to instruct Istio to automatically inject Envoy sidecar proxies when you deploy the BookInfo application into this namespace.

`kubectl label namespace default istio-injection=enabled`{{execute}}

There are other methods to inject the Envoy sidecar, but this technique works well as a pre-installation step for a namespace.

Install the BookInfo application.

`kubectl apply -f bookinfo.yaml`{{execute}}

This YAML file contains all the declarative manifests for the deployments, pods, services that define the application. There is nothing in the YAML or within the application containers that exhibit knowledge or requirements for Istio to be present. The mesh is always independent from your application configuration and logic.
