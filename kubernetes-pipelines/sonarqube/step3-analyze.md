First, clone an example Java project.

`git clone https://github.com/javajon/code-analysis`{{execute}}

This project includes a microservice directory that contains a small Spring Boot application that is built with Gradle. Go into the application source root directory.

`cd code-analysis/microservice`{{execute}}

Analyze this microservices project using SonarQube as the rule engine and dashboard where the results are published.

`./gradlew -Dsonar.host.url=$SONAR_SERVICE sonarqube`{{execute}}

Once complete, navigate to the SonarQube portal and observed the analyzed project. The portal can be reach from the tab labeled "SonarQube Portal" above this command line or from this link: https://[[HOST_SUBDOMAIN]]-31111-[[KATACODA_HOST]].environments.katacoda.com/.
