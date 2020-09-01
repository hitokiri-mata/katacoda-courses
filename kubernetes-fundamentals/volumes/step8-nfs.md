> ** This Step is currently being drafted and will not fully work since the NFS server is not being resolved. ** 

Now that you understand how your Pods can mount to PersistentVolumeClaim (PVC) and claims make connections to PersistentVolumes (PV) we can advance to other types of persistence services. In this scenario well connect to a Network File System (NFS). NFS has been around since the 1980s and it one of the staples for any architect. Other solutions may be better than NFS for you, but it's a common ground for us to understand how to connect your PV to NFS.

NFS is a protocol that allows nodes to read/write data over a network. The protocol works by having a master node running the NFS daemon and stores the data. This master node makes certain directories available over the network.

Clients access the NFS masters shared via drive mounts. From the viewpoint of applications, they are writing to the local disk. Under the covers, the NFS protocol writes it to the NFS master.

At this point, we have two places where we can run an NFS Server. Either inside the cluster or outside the cluster. For this demonstration and learning scenario we will run a NFS Server as a Pod inside the cluster. This NFS Service will create directories and store files _inside_ the container. It's not intended for production, but provides the full NFS protocol and simulates persistent storage inside the container, albeit it's ephemeral storage. If a production NFS system is needed, the NFS server can still run inside the cluster, but should be mounts to external file stores. Many cloud providers offer NFS as a service as well.

Start the NFS Server with its simulated file storage:

```bash
docker run -d --net=host \
   --privileged --name nfs-server \
   katacoda/contained-nfs-server:centos7 \
   /exports/data-0001 \
   /exports/data-0002```{{execute}}

------------
TODO
Alternatives:

`kubectl apply -f nfs-server-mock.yaml`{{execute}}

`helm install stable/nfs-server-provisioner`{{execute}}
------------

The NFS server exposes two directories, data-0001 and data-0002, where files for this demonstration will be stored.

## PersistentVolume

You'll create two PersistentVolumes that for each directory offered by the NFS server with this manifest:

`ccat nfs-pv-tpl.yaml`{{execute}}

The manifest YAML file has a $NFS_HOST inside of it that needs to be replaced with the actual IP of the host where the NFS Server is running as a container. We will set an environment variable:

`export NFS_HOST=$(hostname -I | awk '{print $1}') && echo $NFS_HOST`{{execute}}

With the common Linux `envsubst` command the two $NFS_HOST references can be replaced with the IP address as the manifest is submitted to Kubernetes:

`envsubst < nfs-pv-tpl.yaml | kubectl apply -f -`{{execute}}

Inspect the created PVs:

`kubectl get pv`{{execute}}

## PersistentVolumeClaim

Only one claim can be made against a single volume. You'll create two claims. One for HTML, and one for MySQL file storage:

`ccat nfs-pvc.yaml`{{execute}}

Create the PVCs:

`kubectl create -f nfs-pvc.yaml`{{execute}}

Once created, view the two pairs of PV and PVC you just created:

`kubectl get pv,pvc`{{execute}}

## Start Pod and Mount to PVC

When a deployment is defined, it can assign itself to a claim. The following snippet defines a volume mount for the directory /var/lib/mysql/data which is mapped to the storage mysql-persistent-storage. The storage called mysql-persistent-storage is mapped to the claim called claim-mysql.

```
  spec:
      volumeMounts:
        - name: mysql-persistent-storage
          mountPath: /var/lib/mysql/data
  volumes:
    - name: mysql-persistent-storage
      persistentVolumeClaim:
        claimName: claim-mysql
```

Launch two new Pods with PersistentVolumeClaims. Volumes are mapped to the correct directory when the Pods start allowing applications to read/write as if it was a local directory.

`kubectl create -f mysql-pod.yaml`{{execute}}

`kubectl create -f www-pod.yaml`{{execute}}

Use the command below to view the definition of the Pods.

`ccat mysql-pod.yaml`{{execute}}

`ccat www-pod.yaml`{{execute}}

You can see the status of the Pods starting using:

`kubectl get pods`{{execute}}

The order of submitting these manifests does not matter. If a PersistentVolumeClaim is not assigned to a PersistentVolume, then the Pod will remain in the _Pending_ state until it becomes available.

## Read/Write Data

Next, you'll read/write data to the volume. The Pods can now read/write. MySQL will store all database changes to the NFS Server while the HTTP Server will serve static from the NFS drive. When upgrading, restarting or moving Pods to a different Nodes the data will still be accessible.

To test the HTTP server, write a 'Hello World' index.html homepage to the directory inside the NFS Server. In this scenario, we know the HTTP directory will be based on data-0001 as the volume definition hasn't driven enough space to satisfy the MySQL size requirement.

`docker exec -it nfs-server bash -c "echo 'Tell me and I forget, teach me and I may remember, involve me and I learn.<br>– Benjamin Franklin' > /exports/data-0001/index.html"`{{execute}}

Get the direct IP of the HTTP Server Pod:

`ip=$(kubectl get pod www -o yaml |grep podIP | awk '{split($0,a,":"); print a[2]}'); echo $ip`{{execute}}

When accessing the Pod, it returns Mr. Franklin's inspiration.

`curl $ip`{{execute}}

## Update Data

When the data on the NFS share changes, then the Pod will read the newly updated data:

`docker exec -it nfs-server bash -c "echo 'The more that you read, the more things you will know. The more that you learn, the more places you’ll go.<br>― Dr. Seuss' > /exports/data-0001/index.html"`{{execute}}

`curl $ip`{{execute}}

> I like nonsense, it wakes up the brain cells.

## Data Persistence with Ephemeral Pods

Because a remote NFS server stores the data, if the Pod or the worker Node were to go down, then the data will still be available.

Deleting a Pod will cause it to remove the mounts to its persistent volumes. New Pods can re-mount to the same NFS claims with the same data.

`kubectl delete pod www`{{{execute}}}

`kubectl create -f www2-pod.yaml`{{execute}}

`ip=$(kubectl get pod www2 -o yaml |grep podIP | awk '{split($0,a,":"); print a[2]}'); curl $ip`{{execute}}

Depending on requirements, this same approach works with other storage engines such as GlusterFS, AWS EBS, GCE storage, or OpenStack Cinder.

## Common Storage Interface

This scenario will stop here, but you can go even further. There is another object in Kubernetes called a "StorageClass".

```yaml
kind: StorageClass
apiVersion: storage.k8s.io/v1
metadata:
  name: fast-storage
provisioner: csi-driver.example.com
parameters:
  type: pd-ssd
  csi.storage.k8s.io/provisioner-secret-name: mysecret
  csi.storage.k8s.io/provisioner-secret-namespace: mynamespace
```

A wide variety of storage classes from multiple open-source projects and vendors can be bound to you PVs . All of these projects/products have converged on the Open Storage Interface (OCI) standard. Look here to explore the potential storage classes you can bind to for persistence.

A growing public list of nearly 100 [CSI drivers is listed here](https://kubernetes-csi.github.io/docs/drivers.html) for many of your common persistence volume types. You also can write your own CSI driver.
