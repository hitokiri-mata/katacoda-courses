# Analyze Project with SonarQube #

`helm install stable/sonarqube --name my-sonar --namespace sonarqube -f sonarqube-values.yaml`{{execute}}

`export NODE_PORT=$(kubectl get --namespace sonarqube -o jsonpath="{.spec.ports[0].nodePort}" services my-sonar-sonarqube)`{{execute}}

`export NODE_IP=$(kubectl get nodes --namespace sonarqube -o jsonpath="{.items[0].status.addresses[0].address}")`{{execute}}

`export SONAR_SERVICE=$NODE_IP:$NODE_PORT`{{execute}}

`echo $SONAR_SERVICE`{{execute}}

`wget http://$SONAR_SERVICE`{{execute}}

`./gradlew -Dsonar.host.url=$SONAR_SERVICE sonarqube`{{execute}}






---- TODO
IDE integration with SonarLint