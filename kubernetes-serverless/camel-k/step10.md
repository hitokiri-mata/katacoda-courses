# Removing Camel K, Knative, Istio and your Functions #

All control plane components can be cleaned up with:

`kubectl delete all,pvc,configmap,rolebindings,clusterrolebindings,secrets,sa,roles,clusterroles,crd -l 'app=camel-k'`{{execute}}
