# Analyze Project with SonarQube #

helm install stable/sonarqube --name my-sonar --namespace sonarqube -f sonarqube-values.yaml

`./gradlew sonar`{{execute}}







---- TODO
IDE integration with SonarLint