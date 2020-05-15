Download and install Stern.

`wget https://github.com/wercker/stern/releases/download/1.11.0/stern_linux_amd64`{{execute}}

`mv stern_linux_amd64 /usr/local/bin/stern && chmod +x /usr/local/bin/stern`{{execute}}

Verify Stern is working.

`stern --version`{{execute}}

## Other Log Tailers

There are other open source projects similar to Stern.

[Kubetail](https://github.com/johanhaleby/kubetail)
> Bash script that enables you to aggregate (tail/follow) logs from multiple Pods into one stream. This is the same as running "kubectl logs -f " but for multiple Pods.

[Kail](https://github.com/boz/kail)
> Streams logs from all containers of all matched Pods. Match Pods by Service, ReplicaSet, Deployments, and others. Adjusts to a changing cluster - Pods are added and removed from logging as they fall in or out of the selection.

[K8stail](https://github.com/dtan4/k8stail)
> As you know, kubectl logs can stream only _one_ Pod at the same time. k8stail enables you to watch log streams of _all_ Pods in the specified namespace or labels in real time, like tail -f.
