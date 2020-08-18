For the first Knative step, let's service up a simple echoserver. A solid example for a _Hello World_ experience.

With Knative running there is a new resource type called _Service_:

`kubectl get crd services.serving.knative.dev`{execute}

This is not to be confused with the standard Kubernetes service found in the core API:

`kubectl api-resources --api-group='' | grep services`{{execute}}

The Knative Service declares a full _Serving_ description for an application. A basic Knative Kind:Service looks like this:

```bash
cat << EOF > echo-server-kn-service.yaml
apiVersion: serving.knative.dev/v1
kind: Service
metadata:
  name: helloworld
  namespace: default
spec:
  template:
    spec:
      containers:
        - image: jmalloc/echo-server
EOF```{{execute}}

The above command places that text in a local YAML file that you can submit to Kubernetes. Create a namespace where the service will be located:

`kubectrl create namespace hello`{{execute}}

Remember we have Istio installed so we want to tell Istio that anything in the new hello namespace should be part of the mesh. By adding an Istio label to the _hello_ namespace, Istio's Envoy will be injected into the Pod next to the _echo-server_ application. This will make the Pod a participant of the mesh.

`kubectl label namespace hello istio-injection=enabled`{{execute}}

`kubectl describe namespace hello`{{execute}}

With the namespace ready, declare the knative service:

`kubectl create -f echo-server-kn-service.yaml`{{execute}}

The Knative service has been created:

`kubectl get ksvc --namespace hello`{{execute}}

Additionally, reveal all the core Kubernetes objects Knative is creating related to the service:

`kubectl get all --namespace hello`{{execute}}



TODO 


`curl http://helloworld.default.127.0.0.1.nip.io`{{execute}}

The _echo_server_ application is helpful as it echos the HTTP header information that was passed to it. You can see in the response the Pod that serviced the request as well as the Istio injected tracing information.

Service scale to zero.

Kiali?