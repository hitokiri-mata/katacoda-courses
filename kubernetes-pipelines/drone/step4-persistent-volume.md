Shortly we will be installing a Gig source control server, but before that step it requires a persistent volume. A NFS volume will be allocated.

In this scenario, and for demonstration and learning purposes, the role of the NFS Server is handled by a customized container. The container makes directories available via NFS and stores the data inside the container. In production, it is recommended to configure a dedicated NFS Server. Additionally, for [Kubernetes there are many other volume types](https://kubernetes.io/docs/concepts/storage/volumes/) to choose from. 

Start the NFS using the command

`docker run -d --net=host \
   --privileged --name nfs-server \
   katacoda/contained-nfs-server:centos7 \
   /exports/data-0001`{{execute}}

The NFS server exposes a directory, `data-0001`. In the next steps, this is used to store data.

For Kubernetes to understand the available NFS shares, it requires a PersistentVolume configuration. This command will establish the volume.

`kubectl create -f persistent-volume.yaml`{{execute}}

More on this can be discovered in this Katacoda scenario, [Running Stateful Services on Kubernetes](https://www.katacoda.com/courses/kubernetes/storage-introduction).
