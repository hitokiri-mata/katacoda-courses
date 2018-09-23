# Install Nuclio #

As you see, your Kubernetes cluster based on Minikube is started now or will be available shortly. Verify it's ready for your use:

`minikube version && minikube status`{{execute}}

Helm is a package manager for Kubernetes and is initialized and ready.

`helm version`{{execute}}

A common Helm _chart_ is predefined for installing Nuclio. Normally, popular charts appear in the [curated Helm chart repository](https://github.com/kubernetes/charts) and there may be plans to move Nuclio there. For now, this `repo add` command will allow Helm to find the Nuclio chart:

`helm repo add nuclio https://nuclio.github.io/nuclio/charts`{{execute}}

Install the Nuclio controller

`helm install nuclio/nuclio --name=nuclio --namespace=nuclio --set rbac.create=false --set dashboard.nodePort=32050`{{execute}}

Watch Nuclio starting and verify it's _Available_.

`kubectl --namespace=nuclio get deployments`{{execute}}

## Nuclio CLI ##

Nuclio has a command-line interface (CLI) tool named appropriately `nuctl`. Use this tool to manage your functions on Nuclio. Let's get a recent Nuclio command-line interface (CLI) binary for this Linux account.

`curl -L https://github.com/nuclio/nuclio/releases/download/0.5.10/nuctl-0.5.10-linux-amd64 -o /usr/local/bin/nuctl && chmod +x /usr/local/bin/nuctl`{{execute}}

This tool version will match the controller installed in the next step. Verify this CLI is working by inspecting its current version

`nuctl --help && nuctl version`{{execute}}

-----
Finally, install the Nuclio command-line interface (CLI) tool.

`curl -sSL https://cli.openfaas.com | sudo sh`{{execute}}

Verify it is installed

`faas-cli version`{{execute}}

And login to the Nuclio gateway

`faas-cli login --username admin --password=my-password --gateway=https://[[HOST_SUBDOMAIN]]-31112-[[KATACODA_HOST]].environments.katacoda.com/`{{execute}}

## Nuclio Portal ##

You can also explore the OpenFaaS functions in the portal. On the right there is a tab called Portal or click on this link: https://[[HOST_SUBDOMAIN]]-31112-[[KATACODA_HOST]].environments.katacoda.com/

When prompted, use the same user name and password that was applied above in the secret creation (admin/my-password). For visibility and understanding, leave this tab open throughout the subsequent steps.