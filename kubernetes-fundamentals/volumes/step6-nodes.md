We continue outward to more options for file mounts. The next layer beyond the Pod is the Node. The worker Node hosts the Pods managed by Kubelet. Pods can use the host file system for file storage, however, it's not very common. Just as Pods and their containers can come and go, so do Nodes. File storage on Nodes is just as ephemeral.

## HostPath

A Node is a host of many Pods. There is a file mount option on Nodes called hostPath. A hostPath volume mounts a file or directory from the host Node's filesystem into your Pod. There are a few reasons you may need this. For instance an application may need need to access to the files that are relevant to thea specific Node. DaemonsSets are objects that declare Pods to run on every Node in a cluster, or at least a designated subset of Nodes. Imaging you have 10 nodes in your cluster dedicated to high-performance algorithms that require GPU processors. With Pod affinity to can run those important algorithms on these nodes. You may also want to monitor the performance of the GPUs. This is where DaemonSets come in. The applications in DaemonSets can access the metrics, log files, or other file artifacts on the host machine that are important for observability. These special monitoring Pods will need access to the Host machines file system, via the hostPath volume. Any other type of observability pattern may also want to access these file artifacts. There are a few other examples to use hostPath. Not many, but helpful when you need it.

A Pod may look like this:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: test-pd
spec:
  containers:
  - image: k8s.gcr.io/test-webserver
    name: test-container
    volumeMounts:
    - mountPath: /test-pd
      name: test-volume
  volumes:
  - name: test-volume
    hostPath:
      # directory location on host
      path: /data
      # this field is optional
      type: Directory
```{{execute}}

This application in the Pod has access to the hostPath directory `/data` on the host Node. Remember that Pods do not always land on the same Node each time they are run, therefore each time this Pod accesses `/data`, the files in there will not be the same as the files on other Nodes. If you try to start forcing a Pod to always target a specific Node then you are fighting against Kubernetes, the scheduler, scalability, resilience, and distributed computing.

## DaemonSet with HostPath

Try this DaemonSet:

`ccat daemonic-host-path.yaml`{{execute}}

The last lines define the hostPath. The DaemonSet will start a Pod on each Node in your Katacoda's two node cluster and it will write a file `/var/log/log-writer.log`. Submit the DaemonSet.

`kubectl apply -f daemonic-host-path.yaml`{{execute}}

In a moment the log file will appear on this Node.

`cat /var/log/log-writer.log`{{execute}}

If you get the error message `No such file or directory` it just means the container has not logged anything yet. Try is again in a moment and you will see the log contents with `INFO`.

The busybox container has no knowledge or concern about where the log file will physically be written.
