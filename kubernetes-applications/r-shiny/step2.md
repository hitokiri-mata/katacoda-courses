# Deploy R Shiny Demonstration #

Provisioning a Shiny demonstration is easily done by invoking this command. Declare the Deployment and Service exposing the endpoint 31111.

First, declare the Deployment

`kubectl create -f shiny-demo.yaml`{{execute}}

The Shiny server starts fairly quickly so the Pod status may be already running creating, or initializing. To get a complete status of the deployment availability run this inspection

`kubectl get deployments,pods,services`{{execute}}.

Once available, you can exercise the application two ways. First, simply from the command line,

`curl $(minikube ip):31111`{{execute}}

This same application for can also be seen in your browser from the "Shiny Demo" tab above the command line area or from this link: https://[[HOST_SUBDOMAIN]]-31111-[[KATACODA_HOST]].environments.katacoda.com/
