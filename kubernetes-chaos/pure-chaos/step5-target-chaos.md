The _random-logger_ application is running in the namespace learning_place. The current logic for the chaotic Pod deletion requires a namespaces to be annotated with `chaos=yes`. Assign the _random-logger_ Pods Pods as choas targets by annotating the learning_place namespace:

`kubectl annotate namespace learning_place chaos=yes`{{execute}}

`kubectl describe namespace learning_place`{{execute}}

The next time chaos Job that runs it will see this annotation and the interesting work will be reported. Keep watching for a new Job Pod to appear.

`kubectl get pods`{{execute}}

and keep watching the Pod lifecycle status of the _random-logger_ Pods.

`kubectl get pods -n learning_place`{{execute}}

You should soon be seeing the Pods terminating while the Deployment controller is dutifully trying to maintain the declared scale level of 10 Pods. For real applications, if scaled correctly, all this chaos and resilience will be happening behind the scenes in the cluster while your users experience no downtime or delays.
