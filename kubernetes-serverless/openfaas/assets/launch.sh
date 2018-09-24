echo "Starting Kubernetes using Minikube..."
minikube start --insecure-registry localhost:5000
while [ `docker ps | wc -l` -eq 1 ]
do
  sleep 1
done

# Using minikube's Docker daemon from our localhost
eval $(minikube docker-env)

# Running a local private Docker registry
minikube addons enable registry

echo "Kubernetes using Minikube started."