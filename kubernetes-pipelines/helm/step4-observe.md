Helm deploys all the pods, replication controllers and services. The pod will be in a _pending_ state while the container image is downloaded and until a Persistent Volume is available. Once complete it will move into a _running_ state.

Use the _get_ command to find out what was deployed.

`watch kubectl get deployments,pods,services`{{execute}}

The Pod will be in a _pending_ state while the container image is downloaded and until a Persistent Volume is available. You will see a _master_ and two _slave_[^1] pods. Use this ```clear```{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

`kubectl apply -f pv.yaml`{{execute}}

Redis needs permissions to write to these mount points.

`mkdir /mnt/data1 /mnt/data2 /mnt/data3 --mode=777`{{execute}}

`watch kubectl get deployments,pods,services`{{execute}}

The Pods will move to the _ContainerCreating_ state then once complete, the Pods will move to the _running_ state. It will be a few moments and all the Deployments will eventually move to the _available (1)_ state. Use this ```clear```{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

You have successfully installed a [Redis cluster](https://[[HOST_SUBDOMAIN]]-31112-[[KATACODA_HOST]].environments.katacoda.com/) on Kubernetes.

-----

[^1]: Many hope Redis will follow other tech leaders and move away from the terminology of [slavery](https://en.wikipedia.org/wiki/Master/slave_(technology)) to describe their technology.
