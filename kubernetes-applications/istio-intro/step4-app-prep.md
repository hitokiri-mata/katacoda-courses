## Deploy Katacoda Service

To make the sample Bookinfo application and dashboards available to the outside world on this Katacoda scenario, deploy the following YAML.

`kubectl apply -f /root/katacoda.yaml`{{execute}}

For outside access, an important service is the istio-ingressgateway. The EXTERNAL-IP is set to the IP of the master Node.

`kubectl cluster-info | grep master`{{execute}}

Verify the EXTERNAL-IP is set to the Kubernetes master host IP.

`kubectl get service istio-ingressgateway -n istio-system`{{execute}}

When ready, it will show a status close to this.

```bash
NAME                   TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)                         AGE
istio-ingressgateway   LoadBalancer   10.103.192.174   172.17.0.36   15021:31042/TCP,80:30136/TCP,443:32460/TCP,31400:31798/TCP,15443:30927/TCP   6m51s
```

## Injection label

Prior to the Bookinfo install, add a namespace label to instruct Istio to automatically inject Envoy sidecar proxies when you deploy the Bookinfo application into this namespace.

`kubectl label namespace default istio-injection=enabled`{{execute}}

There are other methods to inject the Envoy sidecar, but this technique works well as a pre-installation step for a namespace.
