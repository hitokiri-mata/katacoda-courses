Kubernetes is not very helpful if you cannot make changes to it and start adding applications. To start editing Kubernetes, explore the command line tool and the dashboard to see how changes can be applied and verified.

As a simple exercise create a namespace.

`kubectl create namespace sandbox-a`{{execute}}
`kubectl create namespace sandbox-b`{{execute}}

Verify the namespace has been created.

`kubectl label namespace sandbox-a group=development
kubectl label namespace sandbox-a customer=alpha`{{execute}}

Now sandboxA has an associated label.

`kubectl describe namespace sandbox-a`{{execute}}

View all the namespaces.

`kubectl get namespaces`{{execute}}

Using the label, view only the namespaces with the label you filter for.

`kubectl get namespaces -l group=development`{{execute}}

Verify these names spaces and labels in the [Kubernetes Dashboard.](https://[[HOST_SUBDOMAIN]]-4194-[[KATACODA_HOST]].environments.katacoda.com/)

Kubernetes relies on the simplicity of labeling and grouping with namespaces as tool to help your organize your applications and hook them together.
