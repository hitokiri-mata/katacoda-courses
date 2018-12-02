First, clone some example Java code.

`git clone https://github.com/javajon/code-analysis`{{execute}}

This project includes a microservice directory that contains a small Spring Boot application that is built with Gradle. Go into the application source root directory.

`cd code-analysis/microservice`{{execute}}

`chmod +x gradlew`{{execute}}

Analyze this microservices project using SonarQube as the rule engine and dashboard where the results are published.

`./gradlew -Dsonar.host.url=$SONAR_SERVICE sonarqube`{{execute}}
