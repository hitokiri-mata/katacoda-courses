We need to apply stress to the PHP application that is now running. We can scale up web traffic with use a convenient load testing tool called [Locust](https://docs.locust.io/en/stable/what-is-locust.html). It's available as container and written in Python. For Kubernetes we will install it from the [Locust Helm Chart](https://github.com/helm/charts/tree/master/stable/locust).

In a second terminal the scenario will run these two commands. First, shell into a new busybox Pod.

`kubectl run -i --tty load-generator --image=busybox /bin/sh`{{execute T2}}

Hit enter for command prompt. Exercise the service in a loop.

`while true; do wget -q -O- http://php-apache.default.svc.cluster.local; done`{{execute T2}}

With the loop running, observe the metrics.

`kubectl top pods`{{execute T1}}

Do you see how the CPU is increasing...