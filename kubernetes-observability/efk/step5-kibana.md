Deploy Kibana ReplicaSet and its assocaited service. The service will be on a NodePort at 30003.

kubectl apply -f https://raw.githubusercontent.com/kubernetes/minikube/master/deploy/addons/efk/kibana-rc.yaml

kubectl apply -f https://raw.githubusercontent.com/kubernetes/minikube/master/deploy/addons/efk/kibana-svc.yaml
