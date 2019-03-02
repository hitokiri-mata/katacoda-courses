echo "Starting Kubernetes using Minikube..."
minikube start
while [ `docker ps | wc -l` -eq 1 ]
do
  sleep 1
done

minikube addons enable dashboard
kubectl create -f /opt/kubernetes-dashboard.yaml

echo "Kubernetes using Minikube started."