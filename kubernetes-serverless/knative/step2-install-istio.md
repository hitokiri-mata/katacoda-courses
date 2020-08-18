Knative delagates many of its features to an underlying network layer. A variety of networking layers, or meshes, can be added to enhance Kubernetes. Knative relies on these networking enhancements. 

## Install networking layer

Knative supports a variety of Kubernetes networking layers such as:

- Ambassador
- Contour
- Gloo
- Istio &#x2714;
- Kong
- Kourier

We'll choose Istio for this scenario.

## Istio Operator

The installation of Istio has been involving and the current recommendation is to install it with the Istio Operator. The [Kubernetes Operators pattern](https://kubernetes.io/docs/concepts/extend-kubernetes/operator/) is definitely the way to go for multi-component controllers such as Istio. While the installation of the Istio Operator is done by Helm, Istio isolated your from the installation of the charts. For installation all you need is the `istioctl` command-line tool.

We start by declaring a recent version of Istio:

`export ISTIO_VERSION=1.6.8`{{execute}}

Download the Istio package:

`curl -L https://istio.io/downloadIstio | sh -`{{execute}}

In the package is the `istioctl` tool, so add it to the system $PATH:

`export PATH="$PATH:/root/istio-${ISTIO_VERSION}/bin"`{{execute}}

Verify the Istio tool is working:

`istioctl version`{{execute}}

`istioctl` will pick up your kubectl config file in the default location of $HOME/.kube/config. With the tool in place, it will take care of the rest of the Operator installation:

`istioctl operator init`{{execute}}

The istio operator components will soon be running:

`kubectl get deployments,pods,services --namespace istio-operator`

Once the operator deployments report available (1), the operator is ready to receive instructions from your to install Istio on Kubernetes.

## Install Istio

The operator remains in the `istio-operator` namespace. The Istio meshing control plane components will run in the `istio-system` namespace. Create the namespace:

`kubectl create ns istio-system`{{execute}}

Instruct the Istio Operator to create the Istio mesh:

```bash
kubectl apply -f - <<EOF
apiVersion: install.istio.io/v1alpha1
kind: IstioOperator
metadata:
  namespace: istio-system
  name: example-istiocontrolplane
spec:
  profile: demo
EOF```{{execute}}

The Istio mesh is starting and will be available in a few moments. Observe its progress:

`kubectl get deployments,pods,services -n istio-system`{{execute}}

Once the deployments report available (1), ask Istio to verify the mesh is installed and ready.

`istioctl verify-install`{{execute}}

You now have a healthy networking mesh that Knative can depend on. In the next step install Knative.



> TODO - remove

## Kourier
For this scenario, install Kourier and add integration with Knative.

The following commands install Kourier and enable its Knative integration.

Install the Knative Kourier controller:

`kubectl apply --filename https://github.com/knative/net-kourier/releases/download/v${KNATIVE_VERSION}/kourier.yaml`{{execute}}

To configure Knative Serving to use Kourier by default:

```bash
kubectl patch configmap/config-network \
  --namespace knative-serving \
  --type merge \
  --patch '{"data":{"ingress.class":"kourier.ingress.networking.knative.dev"}}'```{{execute}}

It will take a few moments to start.

`kubectl get deployments,pods,services --namespace kourier-system`{{execute}}

Fetch the External IP or CNAME:

`kubectl --namespace kourier-system get service kourier`{{execute}}

Save this for configuring DNS below.
