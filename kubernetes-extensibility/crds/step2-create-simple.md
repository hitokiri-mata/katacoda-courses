Let's begin by inspecting a small, example YAML file that declares a simple Thermometer.

`ccat thermometer-crd.yaml`{{execute}}

In this CRD definition, the Kind is CustomResourceDefinition and the CRD is scoped to namespaces. We also provide the plural and short alias names for the same resource. Later we will get to how define other attributes and their types.

> In this scenario we are using Kubernetes v1.18 so in the CRD definition we use `apiVersion: apiextensions.k8s.io/v1`. If you are using Kubernetes v1.16 or newer, then v1 can be used, which has a [slightly improved CRD format](https://kubernetes.io/docs/tasks/access-kubernetes-api/custom-resources/custom-resource-definition-versioning/#specify-multiple-versions).

Before we give this declaration to your cluster, let's see what is currently on the cluster. There should be no pre-existing CRDs.

`kubectl get crds`{{execute}}

And of course, Kubernetes lacks any definition of a Thermometer so a small error ensues.

`kubectl get thermometers`{{execute}}

Now, give the thermometer declaration to Kubernetes.

`kubectl apply -f thermometer-crd.yaml`{{execute}}

Notice the `apply` command was used instead of the `create` because we will be applying additional upgrades to the CRD in the subsequent steps. Kubernetes is now aware of this new resource.

`kubectl get crds`{{execute}}

Thermometer is now an api-resource.

`kubectl api-resources | grep trms`{{execute}}

The resource is also added as `/apis/d2iq/` to the Kubernetes API.

`kubectl get --raw / | jq . | grep -C3 d2iq`{{execute}}

The REST API URL reveals the Thermometer resource

`kubectl get -v-9 --raw /apis/d2iq.com/v1beta1/thermometers/ | jq`{{execute}}

Notice in the last command we added a [verbosity request](https://kubernetes.io/docs/reference/kubectl/cheatsheet/#kubectl-output-verbosity-and-debugging) `-v=9`. With it set to level 9 (highest) we get a bit more insight into how the `kubectl` command is obtaining the resource information.

The command is also piped the output to `jq` to pretty-print the json with syntax highlights.

The CRD definition just defines the resource type and while Kubernetes recognizes the type, there are no instances of the Thermometer resource type.

`kubectl get trms`{{execute}}

In the next step, let's add a Thermometer based on this type.
