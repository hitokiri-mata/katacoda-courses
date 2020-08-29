In this next experiment explore how Chaos Mesh carries out the common experiment of periodic and random Pod removal.

## Install Example Nginx application

Install an example application as a target for the experiment. It's just a deployment of the common Nginx web server with a replication of Pods. Apply the Deployment to the _chaos-sandbox_ namespace:

`kubectl create namespace chaos-sandbox`{{execute}}

`kubectl apply -f nginx.yaml -n chaos-sandbox`{{execute}}

It will take a moment to start all the Pods. You can see the application status in the default namespace:

`kubectl get -n chaos-sandbox deployments,pods,services`{{execute}}

## Define Experiment

The Chaos Mesh has installed several custom resources:

`kubectl get crds`{{execute}}

For this experiment well create a declarative YAML manifests that defines an experiment around `podchaos.chaos-mesh.org`. The experiment specification for the _PodChaos_ manifest appears this way:

`ccat pod-removal-experiment.yaml`{{execute}}

The experiment declares that a 10ms network delay should be injected every minute that lasts for 30 seconds. The delay will only be applied to the target service labeled "app": "web-show". This is the _blast radius_. Only the web-show app has that label:

`kubectl get -n chaos-sandbox deployments,pods,services -l chaos=blast-here`{{execute}}

## Apply Experiment

Because the Chaos Mesh follows the Kubernetes Operator pattern with CRDs, the experiment can be applied like any other Kubernetes object.

`kubectl apply -f pod-removal-experiment.yaml`{{execute}}

The experiment is now running.

`kubectl get NetworkChaos`{{execute}}

## Observe

Based on the cron time in the experiment, watch the Pods randomly terminate and new ones start:

`watch kubectl get -n chaos-sandbox deployments,pods,services -l chaos=blast-here`{{execute}}

Use this `clear`{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

Look at the dashboard, find the experiment, and drill down on its details.

## Update Experiment

At any time you can change the YAML declaration and apply further experiment updates with:

`kubectl apply -f network-delay-exp.yaml`{{execute}}

The experiment can be paused:

`kubectl annotate networkchaos web-show-network-delay experiment.chaos-mesh.org/pause=true`{{execute}}

and resumed:

`kubectl annotate networkchaos web-show-network-delay experiment.chaos-mesh.org/pause-`{{execute}}

Since the NetworkChaos is like any other Kubernetes resource, the experiment can be easily removed.

`kubectl delete -f network-delay-exp.yaml`{{execute}}
