There is a server side component to KUDO. This server-side component is itself a Kubernetes Operator because it manages all KUDO-based Operators. Initialize the server-side component:

`kubectl kudo init --unsafe-self-signed-webhook-ca --wait`{{execute}}

The `init` instruction will:

- Deploy KUDO CRDs
- Create kudo-system namespace
- Deploy the KUDO controller

The certificate manager feature is disabled for this scenario.

Verify the KUDO controller is initialized when the `kudo-controller-manager-0` Pod has a **Running** status:

`kubectl get -n kudo-system pods`{{execute}}

Also, a few new custom resource definitions are associated with the KUDO controller:

`kubectl get crds`{{execute}}
