<img align="right" src="./assets/pact-foundation.png" width="300">

Consumer-drive contracts (CDC) was first promoted as a testing technique in 2006 by [Ian Robinson](https://martinfowler.com/articles/consumerDrivenContracts.html). CDC has been slow to adapt over the years, but remains a vital testing technique. Recently our community has [adopted](https://www.thoughtworks.com/radar/techniques/consumer-driven-contract-testing) a keener interest in CDC as it's a helpful method for testing microservices.

CDC is a concept and testing approach that embraces the perspective multiple _consumers_ that communicate with providers. Typical testing tends to test and define API contracts from the _providers_ perspective. Though a library of contracts, multiple consumers now have a voice to provide producers their expectations on how data should be exchanged between the consumers and producers.

Over the years the [Pact Foundation](https://pact.io/) has established itself as the primary framework that implements this testing approach.

Because this is ideal for microservices, containers and running on Kubernetes.

You will explore a sample application composed of several microservices. The application aggregates population and COVID-19 datasource and presents data at a public API. We will use Pact to verify the API.

You will learn how to:

1. set up a Pack Broker on Kubernetes
2. write a consumer that defines and published Pact contracts
3. deploy and run a few Spring Boot microservices on Kubernetes
4. connect microservices to a database and public data source
5. verify the consumer Pacts against a producer
6. find API defects and fix them
