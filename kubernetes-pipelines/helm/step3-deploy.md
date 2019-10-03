With a known chart name, use the _install_ command to deploy the chart to your cluster.

`helm install stable/redis --name my-redis`{{execute}}

With the install command Helm will launch the required deployments, ReplicaSets, Pods, Services, ConfigMaps or any other Kubernetes resource the chart defines. View all the installed charts.

`helm list`{{execute}}

or

`helm ls`{{execute}}

The installed _my_redis_ chart should be listed.

If you receive an error that Helm _could not find a ready tiller pod_, it means that Helm is still deploying. Wait a few moments for the tiller container image to finish downloading.

The next step will verify the deployment status.
