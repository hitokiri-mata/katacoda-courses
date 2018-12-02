(DRAFTING... working on getting these steps to work...
This Katacoda Minikube instance is not large enough for SonarQube.
Some attempts have been made in the settings to reduce the memory needs.
However, you can run the same instructions on another Kubernetes cluster with
a larger memory setting.)

Install SonarQube using a Helm chart with custom values.

`helm install stable/sonarqube --name sonar --namespace sonarqube --values sonarqube-values.yaml`{{execute}}

The service is a NodePort but at a random value. For Katacode to offer a URL to the service, the port must be at the known number, 31111.

`kubectl patch service sonar-sonarqube -n sonarqube --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":31111}]'`{{execute}}

`export SONAR_SERVICE=${minikube ip}:31111`{{execute}}

`echo $SONAR_SERVICE`{{execute}}

`wget http://$SONAR_SERVICE`{{execute}}

Verify SonarQube is running.
`kubectl get deployment,pods -n sonarqube`{{execute}}

View the SonarQube dashboard here: [SonarQube Dashboard](
https://[[HOST_SUBDOMAIN]]-31111-[[KATACODA_HOST]].environments.katacoda.com/).

With SonarQube running it's now ready to analyze a project.
