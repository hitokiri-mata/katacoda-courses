# Understanding Kubeless on Kubernetes #

The _Kubeless_ secret sauce is your function's source code is deployed into a Kubernetes ConfigMap. The ConfigMap contents is listed with this:

`kubectl get configmaps`{{execute}}

You can view ConfigMap and see the the deployed code here:

`kubectl describe configmap fibonacci`{{execute}}

When the kubeless CLI tool registers your function it sends a custom and declarative Kubernetes manifest file. The file itself has a custom Kubernetes _kind_. These kinds are registered as CRDs. The list of CRDs for Kubeless can be found with this

`kubectl get crds --namespace kubeless`{{execute}}

On deployment _Kubeless_ starts a pre-baked container containing the Python executable, then your function's source code is referenced from the ConfigMap and injected into the Python container. In turn, the container is fronted by a Kubernetes Service where you can invoke the function from a Service call. Inspect the Deployment and Service with this command:

`kubectl get deployments,pods,services`{{execute}}

You can also explore the Kubeless functions in the Kubernetes dashboard.

## Kubernetes Dashboard ##

As an alternative to the kubectl CLI you can also observe and control the cluster activity in the Kubernetes Dashboard. Because the dashboard can be accessed publicly, it is protected and requires the secret access token to login. Because you have administration access to this cluster copy the token from this secret.

`echo -e "\n--- Copy and paste this token for dashboard access ---" && kubectl describe secret $(kubectl get secret | awk '/^dashboard-token-/{print $1}') | awk '$1=="token:"{print $2}' && echo "---"`{{execute}}

Next, by clicking on the _Kubernetes Dashboard_ tab above the command line or from this link: https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/. At the signin prompt select _Token_ and paste in the key you copied in the previous step.

> With public and production Kubernetes *always* be sure to lock down any kind of Kubernetes administration access including [access to the dashboard](https://www.wired.com/story/cryptojacking-tesla-amazon-cloud/).
