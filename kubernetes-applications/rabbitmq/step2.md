## Persistent Volume ##

RabbitMQ will be making a PersistentVolumeClaim for its persistence. A PersistentVolume will be needed. Since this is all temporary in Katacoda, a [hostPath based PersistentVolume](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/#create-a-persistentvolume) is created.

`mkdir -p /mnt/data/rabbitmq && kubectl create -f pv.yaml`{{execute}}

## Install ##

Provisioning RabbitMQ on Kubernetes is easy, just install this [Helm chart](https://github.com/helm/charts/tree/master/stable/rabbitmq).

`helm install stable/rabbitmq --name my-rabbit --namespace rabbit -f rabbit-values.yaml`{{execute}}

The RabbitMQ containers take a few minutes to start. To get a complete status of the deployment availability run this inspection. Watch the Deployment _AVAILABLE_ state change from _0_ to _1_.

`watch kubectl get deployments,pods,services --namespace rabbit`{{execute}}

In a few moments the 3 Pods labeled `pod/my-rabbit-rabbitmq-[1|2|3]` will appear and move to the _Running_ status. Once all are running, discontinue the watch. Use this ```clear```{{execute interrupt}} to ctrl-c and clear the shell or press ctrl-c to break out of the watch.
