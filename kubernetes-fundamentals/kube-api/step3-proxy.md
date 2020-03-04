There is a proxy command that will allow you to access the cluster via localhost. This proxy will run in the background.

`kubectl proxy 8080&`{{execute}}

With this proxy you can access the Kubernetes API locally at port 8080.

`curl localhost:8080`{{execute}}

`curl localhost:8001/api/v1/namespaces/default`{{execute}}

It's not required, but if you want to stop the proxy use the command `fg` to move the proxy ot hte foregound and then exit the proxy with ```clear```{{execute interrupt}} <kbd>Ctrl</kbd>+<kbd>C</kbd>.
