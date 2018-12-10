## Create Fluent Bit RBAC Resources ##

`kubectl apply -f https://raw.githubusercontent.com/fluent/fluent-bit-kubernetes-logging/master/fluent-bit-service-account.yaml`{{execute}}

`kubectl apply -n logging -f https://raw.githubusercontent.com/fluent/fluent-bit-kubernetes-logging/master/fluent-bit-role.yaml`{{execute}}

`kubectl apply -n logging -f https://raw.githubusercontent.com/fluent/fluent-bit-kubernetes-logging/master/fluent-bit-role-binding.yaml`{{execute}}

## Create Fluent Bit Config Map ##

`kubectl apply -n logging -f https://raw.githubusercontent.com/fluent/fluent-bit-kubernetes-logging/master/output/elasticsearch/fluent-bit-configmap.yaml -n logging`{{execute}}

## Deploy Fluent Bit as DaemonSet ##

`kubectl apply -n logging -f https://raw.githubusercontent.com/fluent/fluent-bit-kubernetes-logging/master/output/elasticsearch/fluent-bit-ds.yaml`{{execute}}

