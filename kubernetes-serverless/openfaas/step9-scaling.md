# Scaling #

Deploy the _figlet_ function.

`faas-cli store deploy figlet --label "com.openfaas.scale.zero=true"`{{execute}}

Notice the label passed in ensures the functions deployed, but the Pod is not running. A key feature of functions is when idle, consume no resources and upon activity scale up hot instances. When activity quiets the Pods are released. OpenFaaS manages these scaling details for you, based on load metrics metered to Prometheus.

Exercise the _figlet_ function.

`curl -X POST https://[[HOST_SUBDOMAIN]]-31112-[[KATACODA_HOST]].environments.katacoda.com/function/figlet -d 'No Just Stuff is transcendent'`{{execute}}

Repeat this function in a loop.

`while [ true ]; do curl https://[[HOST_SUBDOMAIN]]-31112-[[KATACODA_HOST]].environments.katacoda.com/function/figlet -d 'NFJS'; done;`{{execute}}

Navigate to the Grafana dashboard and notice the rising activity. Go to the OpenFaaS portal and notice the rising of the replicas with all the invocation counts. Go to the Kubernetes dashboard and in the openfaas-fn namespaces notice all the pods that are scaled up to handle the load.

Ctrl-C to break out of the loop and notice the down scaling as the activity calms down. The nodes will scale to one and after another minute of no activity the single hot pod will be removed to a resting scale of zero. When all is quiet, no resources are consumed.

This exercise is adopted from [lab 9 found here](https://github.com/openfaas/workshop/blob/master/lab9.md).

Alex Ellis demonstrates scaling [in this video](https://youtu.be/H9cx3w5CW3o).