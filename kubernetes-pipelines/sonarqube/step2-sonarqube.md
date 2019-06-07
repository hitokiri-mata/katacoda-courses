## Persistent Volume ##

Jenkins will be making two PersistentVolumeClaims, one for SonarQube and one for the Postgres database. A PersistentVolume will be needed for each. Since this is all temporary in Katacoda, a [hostPath based PersistentVolume](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/#create-a-persistentvolume) is created for both.

`mkdir -p /mnt/data/postgres && kubectl create -f pv-postgres.yaml`{{execute}}

`mkdir -p /mnt/data/sonarqube && kubectl create -f pv-sonarqube.yaml`{{execute}}

Using Helm, install the SonarQube Helm chart with a few custom values.

`helm install stable/sonarqube --name sonar --namespace sonarqube --values sonarqube-values.yaml`{{execute}}

This chart bootstraps a SonarQube instance along with a PostgreSQL database. 

The SonarQube service is exposed as a NodePort but at a random value. This chart does not allow the NodePort value to be assigned. For Katacode to offer a URL to the service, the NodePort must adjusted to a known number, 31111. A workaround is to apply a patch to the port value.

`kubectl patch service sonar-sonarqube -n sonarqube --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":31111}]'`{{execute}}

`export SONAR_SERVICE=https://[[HOST_SUBDOMAIN]]-31111-[[KATACODA_HOST]].environments.katacoda.com/`{{execute}}

`echo $SONAR_SERVICE`{{execute}}

The Postgres database takes a minute or two before it's available. Once healthy, the deployments will register as _available_ (1).

`kubectl get deployments,pods,services -n sonarqube`{{execute}}

When its running, it will respond to your request with a HTTP 200 status.

`wget $SONAR_SERVICE`{{execute}}

View the SonarQube dashboard here: [SonarQube Dashboard](
https://[[HOST_SUBDOMAIN]]-31111-[[KATACODA_HOST]].environments.katacoda.com/).

With SonarQube running it's now ready to analyze a project.

You can login as admin / admin.
z   