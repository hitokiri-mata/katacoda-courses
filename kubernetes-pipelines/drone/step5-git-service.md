Create a namespace for the installation target.

`kubectl create namespace logs`{{execute}}

Install Gogs, a Git version control provider.

`helm repo add incubator https://kubernetes-charts-incubator.storage.googleapis.com/`{{execute}}

`helm install gogs incubator/gogs --namespace gogs --set service.httpNodePort=31111`{{execute}}

Verify Gogs is running. The deployment _Available_ status should will turn to '1' in a few moments.

`kubectl get deployments,pods,services,pv --namespace gogs`{{execute}}
