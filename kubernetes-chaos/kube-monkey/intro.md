# Kube Monkey on Kubernetes #

> Adopting chaos engineering strategies for your production environment is really useful, because it is the only way to test if a system supports unexpected destructive events.

**Kube Monkey** is an implementation of Netflix’s chaos monkey for Kubernetes clusters. It periodically schedules a list of pods termination events in order to test fault tolerance of a highly available system.

kube-monkey runs at a pre-configured hour (run_hour, defaults to 8am) on weekdays, and builds a schedule of deployments that will face a random Pod death sometime during the same day. The time-range during the day when the random pod Death might occur is configurable and defaults to 10am to 4pm.

kube-monkey can be configured with a list of namespaces

to blacklist (any deployments within a blacklisted namespace will not be touched)
To disable the blacklist provide [""] in the blacklisted_namespaces config.param.

You will learn how:

- to install kube-monkey onto Kubernetes
- to enable kube-monkey demo mode to quickly see it in action
- to install and label applications to them eligible targets for chaos

Eugenio Marzo offers a [blog entry on the game](https://devopstribe.it/) and it has been featured on the [Kubernetes blog](https://kubernetes.io/blog/2020/01/22/kubeinvaders-gamified-chaos-engineering-tool-for-kubernetes/). This Katacoda scenario is another learning channel for you to experiment with chaos!
