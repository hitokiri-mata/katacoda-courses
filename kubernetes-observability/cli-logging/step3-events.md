Events the collections of logs generated when events occur on your Kubernetes cluster. These are not your application events, on your application data plane. Instead, these are the events on the cluster plane. Logged events related to changes to the cluster.

`kubectl get events`{{execute}}

Notice you can see events related to you starting the application during the previous step.

These events are stored in etcd and managed by Kubernetes. Because these events accumulate, the older ones are automatically purged. The typical default is one hour, and there is a setting called _time-to-live_ that on some clusters can be adjusted through the `kube-apiserver --event-ttl`. With enough events, it's possible that etcd can overfill. There are tools that can stream these events to other channels such as ElasticSearch and persistent data stores.

`kubectl get events --namespace=my-namespace`{{execute}}

