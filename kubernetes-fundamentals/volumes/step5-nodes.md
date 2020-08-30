We continue output toward more options for file mounts. The next layer out beyond the Pod is the Node. The Host server hosts the Pods managed by Kubelet. Pods can use the host file system for file storage, however it's not very common.

## HostPath

There is a file mount option called hostPath. A hostPath volume mounts a file or directory from the host Node's filesystem into your Pod. There arThe a few reasons you may need this when you need to access files are relevant to the type of Node. DaemonsSets are objects that declare Pods to run on every Node in a cluster, or at least a designated subset of Nodes. For instance, let imaging you have 10 nodes in your cluster dedicated to high performance algorithms that require GPU processors. With Pod affinity to can run those important applications on these nodes. You may also want to monitor the performance of the GPUs. This is where DaemonSets come in. The applications in DaemonSets will want to access the metrics, log files or other file artifacts on the host machine that are related to performance. These special monitoring Pods will need access to the Host machines file system, via the hostPath volume. Any other type of observability pattern may also want to access these file artifacts. There are a few other examples to use hostPath. Not many, but it's possible.

A Pod may look like this:

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

## DaemonSet with HostPath

Try this DaemonSet:

`ccat daemonic-host-path.yaml`{{execute}}

The second to last line defines the hostpath. The DaemonSet will start a Pod on each Node in your Katacoda's two node cluster and it will write a file `/var/log/log-writer.log`. Submit the DaemonSet.

`kubectl apply -f daemonic-host-path.yaml`{{execute}}

In a moment the log file will appear on this Node.

`cat /var/log/log-writer.log`{{execute}}

The busybox container has no knowledge or concern about where the log file will physically be written.
