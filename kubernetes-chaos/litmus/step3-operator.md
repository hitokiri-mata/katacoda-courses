The recommended way to start Litmus is by installing the Litmus Operator. The project's single YAML file has several manifests that include the namespace creation, custom resource definitions (CRDs), service account configuration, and deployments for the Litmus Operator. Apply all this with a single command: 

`kubectl apply -f https://litmuschaos.github.io/litmus/litmus-operator-v1.8.0.yaml`{{execute}}

Check the available namespaces:

`kubectl get namespaces`{{execute}}

In the list, you see `litmus` as a new namespace.

Check the Litmus CRDs have been created:

`kubectl get crds | grep litmus`{{execute}}

Check the Litmus API resources are available:

`kubectl api-resources | grep litmus`{{execute}}

Within the `litmus` namespace are the control plane components for Litmus.

`kubectl get all -n litmus`{{execute}}

They all will soon be available and running. The key components and object associated with Litmus are:

- RBAC for chaotic administration access targeted objects on your cluster.
- The Litmus controller that manages the custom resources and the following apps:
  - **ChaosEngine**: A resource to link a Kubernetes application or Kubernetes node to a ChaosExperiment. ChaosEngine is watched by Litmus' Chaos-Operator which then invokes Chaos-Experiments
  - **ChaosExperiment**: A resource to group the configuration parameters of a chaos experiment. ChaosExperiment CRs are created by the operator when experiments are invoked by ChaosEngine.
  - **ChaosResult**: A resource to hold the results of a chaos-experiment. The Chaos-exporter reads the results and exports the metrics into a configured Prometheus server.
