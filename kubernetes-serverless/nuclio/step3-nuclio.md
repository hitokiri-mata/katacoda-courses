A common Helm _chart_ is predefined for installing Nuclio. Many popular and stable charts appear in the [curated Helm chart repository](https://github.com/kubernetes/charts/stable). Other charts, such as the Nuclio chart, will be in other repos. Use this `repo add` command will allow Helm to find the Nuclio chart:

`helm repo add nuclio https://nuclio.github.io/nuclio/charts`{{execute}}

Create a namespace for the installation target.

`kubectl create namespace nuclio`{{execute}}

The chart references a specific version of Nuclio. Most charts allow you to apply a different container image version. We will reference a slightly newer version of Nuclio. This version will also be referenced when the command-line interface tool (nuctl) is installed.

`export NUCLIO_VERSION=1.4.14`{{execute}}

Install the Nuclio controller using the Helm chart.

`helm install nuclio nuclio/nuclio \
  --version=0.6.14 \
  --namespace=nuclio \
  --set controller.image.tag=$NUCLIO_VERSION-amd64 \
  --set dashboard.nodePort=31000`{{execute}}

Watch Nuclio starting and verify it's _Available_.

`kubectl --namespace=nuclio get deployments,pods,services,crds`{{execute}}
