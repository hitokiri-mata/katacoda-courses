<img align="right" width="300" src="./assets/chaos-mesh.png">

Chaos Mesh is a cloud-native Chaos Engineering platform that orchestrates chaos on Kubernetes environments. At the current stage, it has the following components:

- Chaos Operator: the core component for chaos orchestration. Fully open-sourced.
- Chaos Dashboard: a Web UI for managing, designing, monitoring Chaos Experiments; under development.

Chaos Mesh is a versatile chaos engineering solution that features all-around fault injection methods for complex systems on Kubernetes, covering faults in Pod, network, file system, and even the kernel.

Don't let the project name _mesh_ misguide you. This project is unrelated to _services meshes_ like Istio and Conduit. Hopefully in the future they will leverge the features of service mesh, but for now they are unrelated.

In this scenario you will learn how to:

_- Install Chaos Mesh onto Kubernetes
- Install and label applications to make them eligible targets for chaos
- Design and deliver chaos experiments
- Observe the chaos engine exercise your experiments against the cluster objects
_