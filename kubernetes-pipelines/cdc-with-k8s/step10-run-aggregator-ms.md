TODO about the service...

Move to the _aggregator_ directory.

`cd ~/cdc-with-k8s/aggregator`{{execute}}

## Build microservice container image

Spring Boot with Gradle (or Maven) has a convenient task called _bootBuildImage_. Without having to write a Dockfile this task will bundle the Java application into an optimized container image. Build and tag the  microservice container image.

`./gradlew bootBuildImage --imageName=localhost:5000/$(basename $PWD):0.0.1`{{execute}}

Push the container image to the private registry on your Kubernetes cluster.

`docker push localhost:5000/$(basename $PWD):0.0.1`{{execute}}

Inspect the registry to see the container image has been pushed.

`curl $REGISTRY/v2/_catalog`{{execute}}

## Start microservice

Apply this manifest declaration to set up a Pod and Service for the microservice.

`kubectl apply -f ../cluster/$(basename $PWD).yaml`{{execute}}

## Verify microservice

In a few moments, the Deployment will be available at a NodePort. Explore the data with these rest calls.

`curl -s https://[[HOST_SUBDOMAIN]]-30103-[[KATACODA_HOST]].environments.katacoda.com/ping`{{execute}}

`curl -s https://[[HOST_SUBDOMAIN]]-30103-[[KATACODA_HOST]].environments.katacoda.com/countries`{{execute}}
