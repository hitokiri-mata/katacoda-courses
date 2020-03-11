There is a server side component to KUDO. This server side component, is itself a Kubernetes Operator as is manages all KUDO based operator.

`kubectl kudo init --wait`{{execute}}

The `init` instruction will:

- Deploy KUDO CRDs
- Create kudo-system namespace
- Deploy the KUDO controller

The initialization of the KUDO controller is verified by confirming that the kudo-controller-manager-0 is in a **Running** status.

`kubectl get -n kudo-system pod`{{execute}}
