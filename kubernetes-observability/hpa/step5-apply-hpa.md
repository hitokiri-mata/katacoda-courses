Declare the HPA criteria.

Simple autoscaling declarations can be applied directly with the Kubectl.

`kubectl autoscale deployments/php-apache --cpu-percent=40 --min=1 --max=10`

Hwoever, the default scale down window is 5 minutes. For production that value or longer makes sense, but for this demonstation with want to shorten that scale down window. A hpa.yal file adjusts the behavior with the `scaleDown.stabilizationWindowSeconds` setting. Inspect the HPA declaration for scaling the ph-apache deployment.

`cat hpa.yaml`{{execute}}

Apply these HPA rules.

`kubectl create -f hpa.yaml`{{execute}}

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