TODO - about hte consumer...

Move to the _pact_ directory.

`cd ~/cdc-with-k8s/pact`{{execute}}

For this example, the consumer is written in Node.js. The Pact framework works with many languages including Node.js and Java used in this scenario. The current list of [supported languages](https://docs.pact.io/implementation_guides/other_languages) makes it attractive for use with Kubernetes where we often mix languages in different containers.

## Generate Pact Contracts

Update npm for this environment.

`npm install`{{execute}}

Produce the Pact file. This application uses Jest for driving the testing.

`npm run test:consumer`{{execute}}

Once complete, a new Pact is created. Inspect the pact json file.

`jq -C . pacts/consumer-provider.json  | more`{{execute}}

## Publish Pacts to Pact Broker

Define access to the Pact Broker.

`export PACT_BROKER_URL=https://[[HOST_SUBDOMAIN]]-30111-[[KATACODA_HOST]].environments.katacoda.com/`{{execute}}

`export BROKER_USERNAME=pactbroker`{{execute}}

`export BROKER_PASSWORD=pactbroker`{{execute}}

Publish the pact to the broker.

`npm run publish:pact`{{execute}}

Verify the pact has been published to the [Pact Broker](https://[[HOST_SUBDOMAIN]]-30111-[[KATACODA_HOST]].environments.katacoda.com/).
