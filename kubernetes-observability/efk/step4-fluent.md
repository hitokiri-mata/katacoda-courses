Create the configuration for Fluentd.

`kubectl apply -f https://raw.githubusercontent.com/kubernetes/minikube/master/deploy/addons/efk/fluentd-es-configmap.yaml`{{execute}}

Deploy Fluentd.

`kubectl apply -f https://raw.githubusercontent.com/kubernetes/minikube/master/deploy/addons/efk/fluentd-es-rc.yaml`{{execute}}
