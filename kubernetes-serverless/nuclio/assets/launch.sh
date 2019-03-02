echo 'Starting Kubernetes using Minikube...'
minikube start

minikube addons enable dashboard
kubectl create -f /opt/kubernetes-dashboard.yaml

echo "Kubernetes using Minikube started."