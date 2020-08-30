You may be aware that more than one container may be declared in a Pod. When a Pod is created two primary features are available to all containers in a Pod:

1. Unique virtual IP in the cluster
2. A file volume (emptyDir)

## EmptyDir Volume

Each container in the Pod can mount to the Pod's volume. The mutual reference is called _emptyDir_.

> Why is it called emptyDir? When the Pod is first created this shared volume is truly empty, however over the lifecycle of the Pod, the emptyDir will not always be empty. ¯\\_(ツ)_/¯ Never ask a developer to name your child, you'll regret _emptyKid_.

Since a Pod lifecycle exists on a single Node, then each Pod on a Node stores its files on the Node. The Kubelet takes care of all this file management since its managing all of its Pods on the Node. Each emptyDir can typically be found on the Node in `/var/lib/kubelet/pods/`. However, you should _never_ couple to these files directly. It's a private matter between the Pods and the Kublets, so butt out.

## Mounting Containers to EmptyDir

Pods have a basic specification for mounting to volumes. You saw it in the previous example to mount to ConfigMap volumes. In this example, we connect a Redis container to its Pod's emptyDir volume.

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: redis
spec:
  containers:
  - name: redis
    image: redis
    volumeMounts:
    - name: redis-storage
      mountPath: /data/redis
  volumes:
  - name: redis-storage
    emptyDir: {}
```

This declaration states all Redis storage will be to the Pod emptyDir volume. While this volume is not persistent, mounting Redis to emptyDir is an effective caching solution.

## Sharing Data Between Pod's Containers

There are a few architecture patterns that utilize multiple containers in a Pod. Also called [composite containers](https://kubernetes.io/blog/2015/06/the-distributed-system-toolkit-patterns/). Since all the containers in a Pod connect to the same emptyDir volume, this is a very efficient way to stare files between modular container boundaries. A common example is the _sidecar_ pattern. Inspect this Pod manifest:

`ccat sidecar.yaml`{{execute}}

The Pod named _counter_ consists of a primary contain and two sidecar contains. The primary container is a busybox container that is simply in a shell loop that outputs log messages to two separate log files. These log files are mounted to emptyDir. The two sidecar containers read the log files and locally echo the contents of the log to their STDOUT streams. Let's run the Pod and inspect what happening:

`kubectl apply -f sidecar.yaml`{{execute}}

In a moment the primary busybox container will be writing to the two logs. Asynchronously the two sidecars will be reading those logs. Let's inspect the first sidecar:

`kubectl logs counter count-log-1`{{execute}}

There are the logs. Inspect the second side car:

`kubectl logs counter count-log-2`{{execute}}

The primary container has no knowledge or coupling to the sidecars. Each sidecar has no information about what is generating the logs. Each decoupled container independently writes and reads the logs. There a many uses for sidecars, adapters and ambassadors using this composite container pattern, all because they can efficiently share files with each other via emptyDir.

In the next step will look at another helpful technique for sharing emptyDir, initContainers.
