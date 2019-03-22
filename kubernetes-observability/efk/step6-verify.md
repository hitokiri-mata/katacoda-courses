This EFK stack solution uses the YAML files defined for the Minikube Addon called EFK. Verify the EFK components stack is running. It may take about 2 minutes before all the pods report a _running_ status.

`kubectl get services,pods -n kube-system`{{execute}}

```clear```{{execute interrupt}} to ctrl-c from the watch and clear the shell.
