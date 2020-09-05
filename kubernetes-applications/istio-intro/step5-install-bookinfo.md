Next, you will install a demonstration application called Bookinfo. The application is composed of several microservices and they will all be deployed to the _default_ namespace.

## Envoy Injection

Prior to the Bookinfo install, add a namespace label to instruct Istio to automatically inject Envoy sidecar proxies when you deploy the Bookinfo application into this namespace.

`kubectl label namespace default istio-injection=enabled`{{execute}}

There are other [methods to install the Envoy sidecars](https://istio.io/latest/docs/setup/additional-setup/sidecar-injection/), but this technique works well as a pre-installation step into a specific namespace.

## Start Bookinfo application

Install the Bookinfo application.

`kubectl apply -f istio-$ISTIO_VERSION/samples/bookinfo/platform/kube/bookinfo.yaml`{{execute}}

This YAML file contains all the declarative manifests for the deployments, pods, services that define the application. There is nothing in the YAML or within the application containers that exhibit knowledge or requirements for Istio to be present. The mesh is always independent from your application configuration and logic.

In a few moments, the Bookinfo components will be running.

`kubectl get deployments,pods,services`{{execute}}

Istio will report no issues.

`istioctl analyze`{{execute}}
