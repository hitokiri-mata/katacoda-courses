# Deploy R Shiny Demonstration #

Provisioning a Shiny demonstration is easily done by invoking this command. Declare the Deployment and Service exposing the endpoint 31111.

First, declare the Deployment

`kubectl create -f shiny-demo.yaml`{{execute}}

The Shiny server takes a few minutes to start so the Pod watch the _status_ change to Running. To get a complete status of the deployment availability run this inspection

`kubectl get deployments,pods,services`{{execute}}.

Once available, you can exercise the application two ways. First, simply from the command line,

`minikube service shiny-demo`{{execute}}

This same application for can also be seen in your browser from the "Shiny Demo" tab above the command line area or from this link: https://[[HOST_SUBDOMAIN]]-31111-[[KATACODA_HOST]].environments.katacoda.com/
