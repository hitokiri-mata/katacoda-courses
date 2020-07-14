Move to the _pact_ directory.

`cd ~/cdc-with-k8s/pact`{{execute}}

For this example, the consumer is written in Node.js. The Pact framework works with many languages including Node.js and Java used in this scenario. The current list of [supported languages](https://docs.pact.io/implementation_guides/other_languages) makes it attractive for use with Kubernetes where we often mix languages in different containers.

Define access to the Pact Broker.

`export PACT_BROKER_URL=http://pact-broker-service:9292`{{execute}}

`export BROKER_USERNAME=pactbroker`{{execute}}

`export BROKER_PASSWORD=pactbroker`{{execute}}

Run the consumer test, generate the pact and publish.

`npm run test:consumer`{{execute}}

`npm run publish:pact`{{execute}}

Verify the pact has been published.

`curl -s https://[[HOST_SUBDOMAIN]]-30111-[[KATACODA_HOST]].environments.katacoda.com`{{execute}}
