Test against your cluster

`kubectl example resources`{{execute}}

This will list this Kubernetes cluster resources along with their Names, Namespaced status and Kind alias.

> There is a known problem with Kubernetes running on this Katacoda instance. The pods for `metrics-server` and `katacoda-cloud-provider` are unstable and cycle between healthy `Running` and unstable `CrashLoopBackOff` states. The restarts counter for these Pods are also increasing. However, when the Pod is stable reading `Running, 1/1`, in that time window the `resources` command will work. if `resources` does not work wait a few moments for `metrics-server` to be healthy. To see the health of the Pods can be seen with this command `kubectl get pods -A`{{execute}}

```
NAMESPACE     NAME                                        READY   STATUS             RESTARTS   AGE
kube-system   metrics-server-5b45f688dd-pp7dv             1/1     Running            5          8m11s
or
kube-system   metrics-server-5b45f688dd-pp7dv             0/1     CrashLoopBackOff   7          18m
```
Instead of waiting a work around is to kill the metrics-server and wait for it to start, then run the resources command before it crashes.

`kubectl delete pod -l app=metrics-server -n kube-system`{{execute}}