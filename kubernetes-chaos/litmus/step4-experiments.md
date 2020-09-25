Chaos experiments contain the actual chaos details. These experiments are installed on your cluster as Litmus resources declarations in the form of the Kubernetes CRDs. Because the chaos experiments are just Kubernets YAML manifests, these experiments are published on [Chaos Hub](https://hub.litmuschaos.io). 

> The project refers to these common, public experiments on Chaos Hub as _charts_ but they are different and not to be confused with _Helm charts_.

In this scenario, we'll try one of the most common experiments that kills pods.

> You can deviate from this step and try out your experiments from our list of experiments provided at Chaos Hub but we would suggest you stick with this tutorial to get a deeper understanding first and later move on to try something yourself.

For the scenario, we'll move forward with the `generic/pod-delete` experiment from [Chaos Hub](https://hub.litmuschaos.com).

**Experiment Details:** [https://hub.litmuschaos.io/generic/pod-delete](https://hub.litmuschaos.io/generic/pod-delete)

Install the `generic/pod-delete` experiment using the following command:

`kubectl apply -f https://hub.litmuschaos.io/api/chaos/1.8.0?file=charts/generic/pod-delete/experiment.yaml`{{execute}}

Verify the `pod-delete` experiment has been installed:

`kubectl get chaosexperiments`{{execute}}
