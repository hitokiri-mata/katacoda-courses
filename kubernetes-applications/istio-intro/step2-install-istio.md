This scenario has been tested with this version of Istio.

`export ISTIO_VERSION=1.6.7`{{execute}}

As new versions arrive, this scenario will be upgraded. This version setting will be referenced by the installer.

Install the Istio Operator

`curl -L https://istio.io/downloadIstio | sh -`{{execute}}

Install the Istio client, command line tool.

`export PATH="$PATH:/root/istio-${ISTIO_VERSION}/bin"`{{execute}}

Verify the version of the command line tool.

`istioctl version`{{execute}}

Initialize Istio on this Kubernetes cluster.

`istioctl install --set profile=demo --skip-confirmation`{{execute}}

There are a few [profiles to choose from](https://istio.io/latest/docs/setup/additional-setup/config-profiles/) based on the list of Istio features you want to enable. For this scenario with BookInfo, the _Demo_ profile is ideal.

In a few moments, Istio will be available. You can verify its ready.

`kubectl get deployments,pods.services -A`{{execute}}