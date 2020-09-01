<img align="right" src="./assets/art-wall-kittenprint-9Wq1HpghQ4A-unsplash.jpg" width="300">

This scenario walks through many of the ways your application can read and write to various filesystems and volumes on Kubernetes. Some developers have the notion that apps running in a container can only have ephemeral data because once the container goes away, so does all of its data. That is true if the files you write to are not mounted to external volumes. Sometimes that ephemeral file storage is a welcomed feature, sometimes it's vital the files stores are persisted, backed-up and encrypted at rest. No matter what your file storage requirements are we will explore the spectrum of the techniques to connect your application to various volume types.

This scenario starts with your application reading and writing to its local file system in the container. Then we look at storage in the Pod, then at the Node, then to other Pods and finally to external file stores. We start at the inner layer of your application onion and work our way out.

In the following steps you will learn:

- about the file system inside a container.
- about mounting a volume to a ConfigMap.
- about mounting to the Pod file system.
- about mounting to emptyDir with initContainers.
- about mounting to a Node filesystem.
- about mounting to a Persistent Volume.
- about mounting to a file system outside the cluster.

Volumes, filesystems, and mounts are a complex topic. The length of this scenario reflects this rich topic. You will need some dedicated time to complete all the steps. Each step is a different topic and independent of the other topics. If you wish to skip a topic or have to come back to this scenario later, each step can be explored separately to fit your busy schedule.
