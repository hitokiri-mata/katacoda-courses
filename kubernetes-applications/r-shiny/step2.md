Provisioning a Shiny demonstration is easily done by invoking this command. Declare the Deployment and Service exposing the endpoint 31111.

First, declare the Deployment

`kubectl create -f shiny-demo.yaml`{{execute}}

The Shiny server takes a few minutes to start. Watch the Pod _status_ change from _ContainerCreating_ to _Running_. To get a complete status of the deployment availability run this inspection

`watch kubectl get deployments,pods,services`{{execute}}.

Once complete, the Pod will move to the _running_ state. It will be a few moments and the Deployments will eventually move to the _available (1)_ state.

```clear```{{execute interrupt}} to ctrl-c and clear the shell.

Exercise the application two ways. If your running Minikube outside of Kubernetes this command would launch the Shiny application in your browser.

`minikube service r-shiny`

In Katacoda this same application can also be seen in your browser from the "Shiny Demo" tab above the command line area or from this link: https://[[HOST_SUBDOMAIN]]-31111-[[KATACODA_HOST]].environments.katacoda.com/
