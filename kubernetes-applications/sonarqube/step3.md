# Analyze Project with SonarQube #

(Note: There are a few issues with the chart that are being addressed, so at this moment these steps may not work.)

`cd & helm install stable/sonarqube --name my-sonar --namespace sonarqube -f sonarqube-values.yaml`{{execute}}

`export NODE_PORT=$(kubectl get --namespace sonarqube -o jsonpath="{.spec.ports[0].nodePort}" services my-sonar-sonarqube) && export NODE_IP=$(kubectl get nodes --namespace sonarqube -o jsonpath="{.items[0].status.addresses[0].address}")`{{execute}}

`export SONAR_SERVICE=$NODE_IP:$NODE_PORT`{{execute}}

`echo $SONAR_SERVICE`{{execute}}

`wget http://$SONAR_SERVICE`{{execute}}

You can view the SonarQube dashboard here:
https://[[HOST_SUBDOMAIN]]-31283-[[KATACODA_HOST]].environments.katacoda.com/

Next, lets analyze a small microservices project while using SonarQube as the rule engine and where the results will be published.

`cd code-analysis/microservice`{{execute}}
`./gradlew -Dsonar.host.url=$SONAR_SERVICE sonarqube`{{execute}}
