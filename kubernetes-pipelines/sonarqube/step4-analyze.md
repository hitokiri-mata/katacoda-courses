## Example Project ##
Clone an example Java project.

`git clone https://github.com/javajon/code-analysis`{{execute}}

This project includes a microservice directory that contains a small Spring Boot application built with Gradle. Go into the application source root directory.

`cd code-analysis/microservice`{{execute}}

## Analysis ##
Analyze this microservices project using SonarQube as the rule engine and dashboard where the results are published.

Get the SonarQube engine location.

`SONAR_SERVICE=https://[[HOST_SUBDOMAIN]]-31111-[[KATACODA_HOST]].environments.katacoda.com`{{execute}}

Run the analysis.

`./gradlew -Dsonar.host.url=$SONAR_SERVICE sonarqube`{{execute}}

This tutorial is running on a free Katacoda servers, so the resources are relatively slower so the analysis will take about 15 minutes. Once complete, navigate to the SonarQube portal and observed the analyzed project. The portal can be reach from the tab labeled _SonarQube Portal_ above this command line or from this link: https://[[HOST_SUBDOMAIN]]-31111-[[KATACODA_HOST]].environments.katacoda.com/.
