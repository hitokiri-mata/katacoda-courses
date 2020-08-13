Helm deploys all the chart defined Deployments, Pods, Services. The redis Pod will be in a _pending_ state while the container image is downloaded and until a Persistent Volume is available. Once complete it will move into a _running_ state.

Use the _get_ command to find out what was deployed.

`watch kubectl get statefulsets,pods,services -n redis`{{execute}}

The Pod will be in a _pending_ state while the Redis container image is downloaded and until a Persistent Volume is available. You will see a `my-redis-master-0` and `my-redis-slave-0` pod. Use this `clear`{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

> Unfortunately, the old terminology for the Pod root names remains unchanged. Perhaps the [Redis project still has room for maturation](http://antirez.com/news/122) and a future chart will correct the tight coupling to these names.

Create a Persistent Volume for Redis.

`kubectl apply -f pv.yaml`{{execute}}

and ensure Redis has permissions to write to these mount points.

`mkdir /mnt/data1 /mnt/data2 /mnt/data3 --mode=777`{{execute}}

Now, notice Pod status will change to _Running_.

`watch kubectl get statefulsets,pods,services -n redis`{{execute}}

In a moment and all the Deployments will move to the _ready_ state. Use this `clear`{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

You have successfully installed [Redis](https://[[HOST_SUBDOMAIN]]-31112-[[KATACODA_HOST]].environments.katacoda.com/) on Kubernetes. You now understand how to find and install public applications using Helm charts.
