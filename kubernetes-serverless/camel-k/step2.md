Deploy Dashboard

Kubernetes has a web-based dashboard UI giving visibility into the Kubernetes cluster.

Deploy the dashboard yaml with the command `kubectl apply -f dashboard.yaml`{{execute}}

The dashboard is deployed into the kube-system namespace. View the status of the deployment with `kubectl get pods -n kube-system`{{execute}}

A ServiceAccount is required to login. A ClusterRoleBinding is used to assign the new ServiceAccount (admin-user) the role of cluster-admin on the cluster.

`kubectl create -f service-account.yaml`{{execute}}

This means they can control all aspects of Kubernetes. With ClusterRoleBinding and RBAC, different level of permissions can be defined based on security requirements. More information on creating a user for the Dashboard can be found in the Dashboard documentation.

Once the ServiceAccount has been created, the token to login can be found with:

`kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')`{{execute}}

When the dashboard was deployed, it used externalIPs to bind the service to port 8443. This makes the dashboard available to outside of the cluster and viewable at https://[[HOST_SUBDOMAIN]]-8443-[[KATACODA_HOST]].environments.katacoda.com/

Use the admin-user token to access the dashboard.

For production, instead of externalIPs, it's recommended to use kubectl proxy to access the dashboard. See more details at https://github.com/kubernetes/dashboard.