Declare the HPA criteria.


`kubectl autoscale deployments/php-apache --cpu-percent=50 --min=1 --max=10`{{execute T1}}

With the HPA enabled notice more Pods are started.

`watch kubectl get pods`{{execute T1}}

Once complete use this ```clear```{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

Observe the metrics.

`kubectl top pods`{{execute T1}}

Do you see how the CPU is....