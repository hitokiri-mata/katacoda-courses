A service account should be created to allow chaosengine to run experiments in your application namespace.

Apply the role-base access control (RBAC) specific for the experiment:

`kubectl apply -f https://hub.litmuschaos.io/api/chaos/1.8.0?file=charts/generic/pod-delete/rbac.yaml`{{execute}}

Verify the ServiceAccount RBAC rules have been applied for `pod-delete-sa`:

`kubectl get serviceaccount,role,rolebinding`{{execute}}
