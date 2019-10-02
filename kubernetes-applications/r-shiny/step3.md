Provisioning a Shiny application that generates a word cloud is easily done by invoking this command. Declare the Deployment and Service exposing the endpoint 31112.

`kubectl create -f shiny-wordcloud.yaml`{{execute}}

The Shiny server takes about 1-2 minutes to start. Watch the Deployment _AVAILABLE_ state change from _0_ to _1_. To get a complete status of the deployment availability run this inspection

`watch kubectl get deployments,pods,services`{{execute}}.

Once complete, the Pod will move to the _running_ state. It will be a few moments and the Deployments will eventually move to the _available (1)_ state. Use this ```clear```{{execute interrupt}} break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

In Katacoda, you can access the application in your browser from the "Shiny Wordcloud" tab above the command line area or from this link: https://[[HOST_SUBDOMAIN]]-31112-[[KATACODA_HOST]].environments.katacoda.com/.
