Run this random-logger container to start generating continuously random logging events.

`kubectl run random-logger --image=chentex/random-logger --namespace=logging`{{execute}}

Thank you to Vicente Zepeda for providing this [beautifully simple container](https://github.com/chentex/random-logger).

-------

As another log generating example, deploy a Nginx container and port-forward the traffic to your localhost.

`kubectl run nginx --image=nginx -n logging`{{execute}}

`kubectl port-forward nginx-8586cf59-kpbf6 8081:80 &`{{execute}}

Curl it a few times, and press Ctrl+C when done.

`while true; do curl localhost:8081; sleep 2; done`{{execute}}