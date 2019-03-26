Deploy Kibana. The service will be on a NodePort at 31000.

`helm install stable/kibana --name=kibana --namespace=logs --set env.ELASTICSEARCH_URL=http://elasticsearch-client:9200 --set service.type=NodePort --set service.nodePort=31000`{{execute}}

> Security caution. This NodePort exposes the logging to the outside world intentionally for demonstration purposes. However, for production Kubernetes clusters never expose the Kibana dashboard service to the world without any authentication.

Kibana will start in a few moments and you can observe its progress.

`watch kubectl get deployments,pods,services --namespace=logs`{{execute}}

Once complete, the Pods will move to the _running_ state. It will be a few moments and the Deployments will eventually move to the _available (1)_ state. Use this ```clear```{{execute interrupt}} to ctrl-c and clear the shell or press ctrl-c to break out of the watch.

You have successfully installed a [EFK solution](https://[[HOST_SUBDOMAIN]]-31000-[[KATACODA_HOST]].environments.katacoda.com/) on Kubernetes.