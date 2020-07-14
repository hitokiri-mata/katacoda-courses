Go to the Pact directory.

`cd ~/pact`{{execute}}

Define access to the Pact Broker.

`export PACT_BROKER_URL=`{{execute}}

`export BROKER_USERNAME=pactbroker`{{execute}}

`export BROKER_PASSWORD=pactbroker`{{execute}}

Run the consumer test, generate the pact and publish.

`npm run test:consumer`{{execute}}

`npm run publish:pact`{{execute}}

Verify the pact has been published.

`curl -s https://[[HOST_SUBDOMAIN]]-30111-[[KATACODA_HOST]].environments.katacoda.com`{{execute}}
