For the first Knative step, let's service up a simple echoserver. A solid example for a _Hello World_ experience.

With Knative running there is a new resource type called _Service_:

`kubectl get crd services.serving.knative.dev`{{execute}}

This is not to be confused with the standard Kubernetes service found in the core API:

`kubectl api-resources --api-group='' | grep services`{{execute}}

The Knative Service declares a full _Serving_ description for an application. A basic Knative Kind:Service looks like this:

```bash
cat << EOF > echo-server-kn-service.yaml
apiVersion: serving.knative.dev/v1
kind: Service
metadata:
  name: helloworld
spec:
  template:
    spec:
      containers:
        - image: jmalloc/echo-server:0.1.0
EOF```{{execute}}

The above command places that text in a local Kubernetes YAML file that you will submit to the Knative controller. To add the application on Knative the same kubectl CLI tool can be used just like any other Kubernetes based application. The difference is the YAML manifest uses a resource called _Service_.

Create a namespace where the service will be located:

`kubectl create namespace hello`{{execute}}

Remember we have Istio installed so we want to tell Istio that anything in the new _hello_ namespace should be part of the mesh. By adding an Istio label to the _hello_ namespace, Istio's Envoy will be injected into the Pod next to the _echo-server_ application. This will make the Pod a participant of the mesh.

`kubectl label namespace hello istio-injection=enabled`{{execute}}

`kubectl describe namespace hello`{{execute}}

With the namespace ready, declare your new Knative service:

`kubectl create --namespace hello -f echo-server-kn-service.yaml`{{execute}}

The Knative service has been created:

`kubectl get ksvc --namespace hello`{{execute}}

Additionally, reveal all the objects Knative is managing related to the service:

`kubectl get all --namespace hello`{{execute}}
