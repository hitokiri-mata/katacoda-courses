# Chaoskube on Kubernetes #

<img align="right" alt="Chaoskube" title="Chaoskube" src="./assets/chaoskube.png" width=300>

> Adopting chaos engineering strategies for your production environment is useful, because it is the only way to test if a system supports unexpected destructive events. -- [KubeInvaders](https://kubernetes.io/blog/2020/01/22/kubeinvaders-gamified-chaos-engineering-tool-for-kubernetes)

Chaoskube periodically kills random Pods in your Kubernetes cluster, which allows you to test how your system behaves under arbitrary Pod failures. Chaoskube is a tool designed by Martin Linkhorst and its [open source is found here](https://github.com/linki/chaoskube).

You will learn how to:

- Install Chaoskube onto Kubernetes
- Adjust the Helm chart configuration to quickly see it in action
- Install and label applications to make them eligible targets for chaos
