# Removing Riff, Knative, Istio and your Functions #

All control plane components can be cleaned up with:

`kubectl delete namespace knative`{{execute}}

`kubectl delete namespace istio`{{execute}}