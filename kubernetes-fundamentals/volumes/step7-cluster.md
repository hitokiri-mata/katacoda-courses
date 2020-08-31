So far the mounts we have been discussing have been within the containers and Pods and Nodes. The next mount type is at the cluster level. 

For this, two new Kubernetes resources will need to be declared; a PersistentVolume and a PersistentVolumeClaim. Pods can connect their mounts to these PersistentVolumeClaim and the claims are bound to PersistentVolumes.

## PersistentVolume

First, define a PersistentVolume.

`ccat local-storage-pv.yaml`{{execute}}

Within the specification a declaration is made to allocate a volume at /mnt/data on the host as _local-storage_ on the _Filesystem_. A 3Gi volume will be reserved. This is simply making the declaration that a new volume is available. 

Submit this PV to the cluster.

`kubectl apply -f local-storage-pv.yaml`{{execute}}

Inspect this newly created PV:

`kubectl get pv`{{execute}}

The columns should look familiar as the follow the declarations in the submitted manifest. Notice the Status column is blank. Next, bind a claim to this volume to see the status change.

## PersistentVolumeClaim

Second, define a PersistentVolumeClaim against the PersistentVolume.

`ccat local-storage-pv.yaml`{{execute}}

Submit this PV to the cluster.

`kubectl apply -f local-storage-pv.yaml`{{execute}}

Inspect this newly created PV:

`kubectl get pvc`{{execute}}

`kubectl get pv`{{execute}}

Now the `Status` column reads `bound`, This tells you the claim found the volume. Once a claim is bound to a volume, no other claims can be made to the volume while this claim exists. The `local-storage` matching label between the PV and PVC declarations is was allow the pairing to occur. Other declarations are part of hte pariing considering such as the claim has to be a size the same or smaller than the volume size allocation. In this case the sizes matched to allow the binding to occur.

## Mount Pod to PersistentVolumeClaim

We define a simple NGINX Pod.

`ccat local-storage-pod.yaml`{{execute}}

The Pod's mount is it to the same label found in the PVC as `name: nginx-pvc`. Submit this Pod declaration.

`kubectl apply -f local-storage-pod.yaml`{{execute}}

`ls /mnt`{{execute}}

There are hundreds of others volume types you can declare and bind to and well get to that in the steps after this step.
