Delete the application using the same YAML resource.

`kubectl delete --namespace hello --filename echo-server-kn-service.yaml`{{execute}}

Knative and its connection to Istio will ensure all the other supporting objects are also scrubbed:

`kubectl get all --namespace hello`{{execute}}
