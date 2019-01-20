# Deploy Shiny Wordcloud Application #

Provisioning a Shiny application that generates a wordcloud is easily done by invoking this command. Declare the Deployment and Service exposing the endpoint 31112.

`kubectl create -f shiny-wordcloud.yaml`{{execute}}

This Shiny service takes a few minutes to start. Watch the Pod _status_ change from _ContainerCreating_ to _Running_. To get a complete status of the deployment availability run this inspection

`kubectl get deployments,pods,services`{{execute}}.

Once available, you can exercise the application two ways. If your running Minikube outside of Kubernetes this command would launch the Shiny application in your browser.

`minikube service shiny-wordcloud`

This same application for can also be seen in your browser from the "Shiny Wordcloud" tab above the command line area or from this link: https://[[HOST_SUBDOMAIN]]-31112-[[KATACODA_HOST]].environments.katacoda.com/