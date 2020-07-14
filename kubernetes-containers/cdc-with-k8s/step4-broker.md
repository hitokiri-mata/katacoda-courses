`cd cluster`{{execute}}

A small database for persisting the Pacts.

`kubectl apply -f pact-broker-postgres.yaml`{{execute}}

`kubectl apply -f pact-broker.yaml`{{execute}}


Verify the UI is available...

`curl -s https://[[HOST_SUBDOMAIN]]-30111-[[KATACODA_HOST]].environments.katacoda.com`{{execute}}

