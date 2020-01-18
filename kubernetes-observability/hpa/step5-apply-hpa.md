Declare the HPA criteria.


`kubectl autoscale deployments/php-apache --cpu-percent=40 --min=1 --max=10`{{execute T1}}

A new HPA is now registered. Inspect the HPA list.

`kubectl get hpa`{{execute}}

Inspect the state of the HPA with the describe command.

`kubectl describe hpa php-apache`{{execute}}

With the HPA enabled notice more Pods are started.

`kubectl get deployments,pods,services`{{execute}}

Once complete use this ```clear```{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

Observe the metrics.

`kubectl top pods`{{execute T1}}

Do you see how the CPU is...