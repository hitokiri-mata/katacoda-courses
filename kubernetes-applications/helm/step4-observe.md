Helm deploys all the pods, replication controllers and services. The pod will be in a _pending_ state while the container image is downloaded and until a Persistent Volume is available. Once complete it will move into a _running_ state.

Use the _get_ command to find out what was deployed.

`kubectl get deployments,pods,services`{{execute}}

The Pod will be in a pending state while the container image is downloaded and until a Persistent Volume is available.

`kubectl apply -f pv.yaml`{{execute}}

Redis needs permissions to write 

`chmod 777 -R /mnt/data*`{{execute}}

Once complete it will move into a running state. A Redis cluster is running on Kubernetes.