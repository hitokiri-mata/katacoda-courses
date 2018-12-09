To deploy an application on Knative the same kubectl CLI tool can be used just like any other Kubernetes based application. The difference is in the YAML declaration using a resource called _service_. This is not to be confused with the core Kubernetes service resource, instead this is a resource for Knative. It's declaration look like this, 

`curl https://raw.githubusercontent.com/knative/docs/master/serving/samples/helloworld-go/service.yaml`{{execute}}

Notice the kind _Service_ and the apiVersion that defines its context.

This is a custom resource definition that was added to Kubernetes when you installed Knative. There are a bunch of custom resources definitions (crds). List them.

`kubectl get crds`{{execute}}

In this this is the definition for Service.

`kubectl get crds | grep Service`{{execute}}

Using this services and YAML deploy an example Hello World application written in Go. The code and app container has already been published to a registry.

`kubectl -f create https://raw.githubusercontent.com/knative/docs/master/serving/samples/helloworld-go/service.yaml`{{execute}}
