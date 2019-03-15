Shortly we will be installing a Git source control server, but before that step it requires a PersistentVolume. Since this is all temporary in Katacoda, a [hostPath based PersistentVolume](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/#create-a-persistentvolume) is created 

`mkdir /mnt/data && kubectl create -f pv-host-path.yaml`{{execute}}
