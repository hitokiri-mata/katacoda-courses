Next, you will install a demonstration application called Book info. The application is composed of several microservices and they will all be deployed to the _default_ namespace.  

Install the BookInfo application.

`kubectl apply -f istio-${ISTIO_VERSION}/samples/bookinfo/platform/kube/bookinfo.yaml`{{execute}}

`kubectl apply -f istio-${ISTIO_VERSION}/samples/bookinfo/networking/bookinfo-gateway.yaml`{{execute}}

This YAML file contains all the declarative manifests for the deployments, pods, services that define the application. There is nothing in the YAML or within the application containers that exhibit knowledge or requirements for Istio to be present. The mesh is always independent from your application configuration and logic.

In a few moments, the BookInfo components will be running.

`kubectl get deployments,pods,services`{{execute}}

Once running, the application's main page can be reached at https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/productpage.
