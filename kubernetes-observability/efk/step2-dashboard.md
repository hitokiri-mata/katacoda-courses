Kubernetes has a web-based dashboard UI giving visibility into the Kubernetes cluster. As part of the initialization the dashboard was deployed and assigned a NodePort of 30000. This makes the dashboard available to outside of the cluster and viewable. From the [Dashboard](https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/) to explore this cluster.

For your cluster, the latest dashboard yaml definition can be downloaded from https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml.
