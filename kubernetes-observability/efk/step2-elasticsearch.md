## Persistent Volume ##

ElasticSearch will be making a PersistentVolumeClaim for its persistence. A PersistentVolume will be needed. Since this is all temporary in Katacoda, a [hostPath based PersistentVolume](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/#create-a-persistentvolume) is created.

`mkdir -p /mnt/data/efk && kubectl create -f pv.yaml`{{execute}}

## Install ElasticSearch ##

Deploy the public Helm chart for ElasticSearch.

`helm install stable/elasticsearch --name=elasticsearch --namespace=logs`{{execute}}
