Deploy ElasticSearch and its associated service.

kubectl apply -f https://raw.githubusercontent.com/kubernetes/minikube/master/deploy/addons/efk/elasticsearch-rc.yaml

kubectl apply -f https://raw.githubusercontent.com/kubernetes/minikube/master/deploy/addons/efk/elasticsearch-svc.yaml
