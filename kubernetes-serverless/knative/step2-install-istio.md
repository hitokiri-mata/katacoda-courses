Knative delagates many of its features to an underlying network layer. A variety of networking layers, or meshes, can be added to enhance Kubernetes. Knative relies on these networking enhancements. 

## Install networking layer

Knative supports a variety of Kubernetes [networking layers](https://knative.dev/v0.15-docs/install/any-kubernetes-cluster/#installing-the-serving-component) such as:

- Ambassador
- Contour
- Gloo
- Istio &#x2714;
- Kong
- Kourier

We'll choose Istio for this scenario.

## Install Istio Operator

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

`kubectl get deployments,pods,services --namespace istio-operator`{{execute}}

Once the istio-operator deployment reports available (1), the operator is ready to receive instructions from your to install Istio on Kubernetes.

## Start Istio

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

There operator will accept a [configuration profile](https://istio.io/latest/docs/setup/additional-setup/config-profiles/), so for this scenario we chose `demo` from the list of profiles (demo, default, minimal, remote). The Istio mesh is starting and will be available in a few moments. Observe its progress:

`kubectl get deployments,pods,services -n istio-system`{{execute}}

Once the deployments report available (1), ask Istio to verify the mesh is installed and ready.

`istioctl verify-install`{{execute}}

If you see the word for status as `RECONCILING`, then it's not ready and still initializing. When you see the word for status as `HEALTHY`, then it's working. [You can ignore the error message, they are working on it.](https://github.com/istio/istio/issues/25194)

You now have a healthy networking mesh that Knative can depend on. In the next step install Knative.
