## Persistent Volume ##

ElasticSearch will be making a PersistentVolumeClaim for its persistence. A PersistentVolume will be needed. Since this is all temporary in Katacoda, a [hostPath based PersistentVolume](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/#create-a-persistentvolume) is created.

`mkdir -p /mnt/data/efk-master-0 && kubectl create -f pv-master.yaml`{{execute}}

`mkdir -p /mnt/data/efk-data-0 && kubectl create -f pv-data.yaml`{{execute}}

## Install ElasticSearch ##

Deploy the public Helm chart for ElasticSearch. Many of the default parameters are downsized to fit in this KataCoda cluster.

`helm install stable/elasticsearch --name=elasticsearch --namespace=logs \
--set client.replicas=1 \
--set master.replicas=1 \
--set cluster.env.MINIMUM_MASTER_NODES=1 \
--set cluster.env.RECOVER_AFTER_MASTER_NODES=1 \
--set cluster.env.EXPECTED_MASTER_NODES=1 \
--set data.replicas=1 \
--set data.heapSize=300m \
--set master.persistence.storageClass=elasticsearch-master \
--set master.persistence.size=5Gi \
--set data.persistence.storageClass=elasticsearch-data \
--set data.persistence.size=5Gi`{{execute}}

ElasticsSearch will start in a few minutes and you can observe its progress. **Be patient, as it takes time for ElasticSearch to set itself up, even with this smaller configuration.**

`watch kubectl get deployments,pods,services --namespace=logs`{{execute}}

Keep in mind the chart's default settings are appropriately opinionated for a production deployment.

Once complete, the 3 Pods will move to the _running_ state. It will be a few moments and the Deployment status will eventually move to the _available (1)_ state. Use this ```clear```{{execute interrupt}} to ctrl-c and clear the shell or press ctrl-c to break out of the watch.
