Move to the _cluster_ directory.

`cd ~/cdc-with-k8s/cluster`{{execute}}

<img align="right" src="./assets/pact-io.png" width="100">
Here there are two Kubernetes manifest files that declare the Deployments for the Pact Broker and its associated Postgress database. Apply these declarations.

`kubectl apply -f pact-broker-postgres.yaml`{{execute}}

`kubectl apply -f pact-broker.yaml`{{execute}}

The database is used for storing the Pacts and is attached to a Persistent Volume (PV) reserved in this cluster. In a production environment this persistence option can be further hardened.

<img align="right" src="./assets/pact-broker-example.png" width="300">
In a few moments the new web interface will be available. Open the [Pact Broker web interface](
https://[[HOST_SUBDOMAIN]]-31000-[[KATACODA_HOST]].environments.katacoda.com/) and observe it's contents.
