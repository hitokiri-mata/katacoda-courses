Test against your cluster

`kubectl example resources`{{execute}}

This will list this Kubernetes cluster resources along with their Names, Namespaced status and Kind alias.

> There is a known problem with Kubernetes running on this Katacoda instance. The pods for `metrics-server` and `katacoda-cloud-provider` are unstable cycle between healthy and unstable states such as `Running` to `'CrashLoopBackOff`. The restarts counter for these Pods are also increasing. However, when the Pod is stable reading `Running, 1/1`, in that time window the `resources` command will work. if `resources` does not work wait a few moments for `metrics-server` to be healthy. To see the health of the Pods can be seen with this command `kubectl get pods -A`{{execute}}

```
NAMESPACE     NAME                                        READY   STATUS             RESTARTS   AGE
kube-system   metrics-server-5b45f688dd-pp7dv             1/1     Running            5          8m11s
or
kube-system   metrics-server-5b45f688dd-pp7dv             0/1     CrashLoopBackOff   7          18m
```
