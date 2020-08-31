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

The NFS server exposes two directories, data-0001 and data-0002, where files for this demonstration will be stored.

## PersistentVolume

The NFS Server is offering two directories for storage so you'll create two PersistentVolumes that for each directory that look like this:

`ccat nfs-pv.yaml`{{execute}}

Create the two PVs:

`kubectl create -f nfs-pv.yaml`{{execute}}

Inspect the created PVs:

`kubectl get pvs`{{execute}}

## PersistentVolumeClaim

Only once claim can be made against a single volume. You'll create two claims. One for HTML and one for MYSql file storage:

`ccat nfs-pvc.yaml`{{execute}}

Create the PVs:

`kubectl create -f nfs-pvc.yaml`{{execute}}

Once created, view the two PersistentVolumesClaims you just created:

`kubectl get pvcs`{{execute}}

## Start Pod and Mount to PVC

When a deployment is defined, it can assign itself to a previous claim. The following snippet defines a volume mount for the directory /var/lib/mysql/data which is mapped to the storage mysql-persistent-storage. The storage called mysql-persistent-storage is mapped to the claim called claim-mysql.

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

Launch two new Pods with Persistent Volume Claims. Volumes are mapped to the correct directory when the Pods start allowing applications to read/write as if it was a local directory.

`kubectl create -f mysql-pod.yaml`{{execute}}

`kubectl create -f www-pod.yaml`{{execute}}

Use the command below to view the definition of the Pods.

`ccat mysql-pod.yaml`{{execute}}

`ccat www-pod.yaml`{{execute}}

You can see the status of the Pods starting using:

`kubectl get pods`{{execute}}

If a Persistent Volume Claim is not assigned to a Persistent Volume, then the Pod will be in Pending mode until it becomes available.

## Read/Write Data

Next, you'll read/write data to the volume. Our Pods can now read/write. MySQL will store all database changes to the NFS Server while the HTTP Server will serve static from the NFS drive. When upgrading, restarting or moving containers to a different machine the data will still be accessible.

To test the HTTP server, write a 'Hello World' index.html homepage. In this scenario, we know the HTTP directory will be based on data-0001 as the volume definition hasn't driven enough space to satisfy the MySQL size requirement.

`docker exec -it nfs-server bash -c "echo 'Hello World' > /exports/data-0001/index.html"`{{execute}}

Based on the IP of the Pod, when accessing the Pod, it should return the expected response.

`ip=$(kubectl get pod www -o yaml |grep podIP | awk '{split($0,a,":"); print a[2]}'); echo $ip`{{execute}}

`curl $ip`{{execute}}

## Update Data

When the data on the NFS share changes, then the Pod will read the newly updated data:

`docker exec -it nfs-server bash -c "echo 'Hello NFS World' > /exports/data-0001/index.html"`{{execute}}

`curl $ip`{{execute}}

## Data Persistence with Ephemeral Pods

Because a remote NFS server stores the data, if the Pod or the worker Node were to go down, then the data will still be available.

Deleting a Pod will cause it to remove the mounts to any persistent volumes. New Pods can pick up and re-use the NFS claims.

`kubectl delete pod www`{{{execute}}}

`kubectl create -f www2-pod.yaml`{{exeucte}}

`ip=$(kubectl get pod www2 -o yaml |grep podIP | awk '{split($0,a,":"); print a[2]}'); curl $ip`{{execute}}

The applications now use a remote NFS for their data storage. Depending on requirements, this same approach works with other storage engines such as GlusterFS, AWS EBS, GCE storage or OpenStack Cinder.
