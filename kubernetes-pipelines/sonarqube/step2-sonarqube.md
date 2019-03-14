SonarQube relies on a Postgres database for its storage. First, apply a StorageClass object as a dependency before Postgres starts.

`kubectl create -f storage.yaml`{{execute}}

Using Helm, install the SonarQube Helm chart with a few custom values.

> Note: This command fails currently related to the PersistentVolume and the PVC. A correction is in progress. [More info](https://github.com/helm/charts/issues/11304).

----

`helm install stable/sonarqube --name sonar --namespace sonarqube --values sonarqube-values.yaml`{{execute}}

This chart bootstraps a SonarQube instance with a PostgreSQL database. The service is exposed as a NodePort but at a random value. For Katacode to offer a URL to the service, the port must adjusted to a known number, 31111.

`kubectl patch service sonar-sonarqube -n sonarqube --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":31111}]'`{{execute}}

`export SONAR_SERVICE=[[HOST_SUBDOMAIN]]-31111-[[KATACODA_HOST]]`{{execute}}

`echo $SONAR_SERVICE`{{execute}}

The Postgres database takes a minute or two before it's available. Once healthy, the deployments will register as _available_ (1).

`kubectl get deployments,pods,services -n sonarqube`{{execute}}

When its running, it will respond to your request.

`wget http://$SONAR_SERVICE`{{execute}}

View the SonarQube dashboard here: [SonarQube Dashboard](
https://[[HOST_SUBDOMAIN]]-31111-[[KATACODA_HOST]].environments.katacoda.com/).

With SonarQube running it's now ready to analyze a project.
