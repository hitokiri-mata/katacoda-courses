# Analyze Project with SonarQube #

(Note: There are a few issues with the chart that are being addressed, so at this moment these steps may not work.)

`cd && helm install stable/sonarqube --name my-sonar --namespace sonarqube -f sonarqube-values.yaml`{{execute}}

`export NODE_IP=$(kubectl get nodes --namespace sonarqube -o jsonpath="{.items[0].status.addresses[0].address}")`{{execute}}

`kubectl patch service my-sonar-sonarqube -n sonarqube --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":31111}]'`{{execute}}

`export SONAR_SERVICE=$NODE_IP:31111`{{execute}}

`echo $SONAR_SERVICE`{{execute}}

`wget http://$SONAR_SERVICE`{{execute}}


You can view the SonarQube dashboard here:
https://[[HOST_SUBDOMAIN]]-31283-[[KATACODA_HOST]].environments.katacoda.com/

Next, lets analyze a small microservices project while using SonarQube as the rule engine and where the results will be published.

`cd code-analysis/microservice`{{execute}}
`./gradlew -Dsonar.host.url=$SONAR_SERVICE sonarqube`{{execute}}
