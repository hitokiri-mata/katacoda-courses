This EFK stack solution uses the YAML files defined for the Minikube Addon called EFK. Verify the EFK components stack is running. It may take 5-7 minutes before all the pods are _running_.

`kubectl get services,pods -n kube-system`{{execute}}
