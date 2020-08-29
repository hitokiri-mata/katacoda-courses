Your first experiment will apply a network delay to an application.

## Install Example Web-show application

Install an example application as a target for the experiment. This application is designed by the Chaos Mesh project as a _hello world_ example for your first experiment. The following shell script will deploy the example application as a Kubernetes Deployment and Service. 

`curl -sSL https://mirrors.chaos-mesh.org/v0.9.0/web-show/deploy.sh | sh`{{execute}}

It will take a moment to start. You can see the application status in the default namespace:

`kubectl get deployments,pods,services`{{execute}}

If you are curious, you can inspect the installation script:

`curl https://mirrors.chaos-mesh.org/v0.9.0/web-show/deploy.sh`{{execute}}

Access the ClusterIP service using the port-forward feature

`kubectl port-forward service/web-show 8081:8081 &`{{execute}}

http://localhost:8081

## Define Experiment

The Chaos Mesh has installed several custom resources:

`kubectl get crds`{{execute}}

You can reference these resources to create declarative YAML manifests that define your experiment. For your first experiment, you will impose a _network delay_. The delay is defined in the _NetworkChaos_ manifest this way:

`ccat network-delay-exp.yaml`{{execute}}

## Apply Experiment

Because the Chaos Mesh follows the Kubernetes Operator pattern with CRDs, the experiment can be applied like any other Kubernetes object.

`kubectl apply -f network-delay.yaml`{{execute}}

The experiment is now running.

`kubectl get NetworkChaos`{{execute}}

## Observe


## Update Experiment

At any time you can change the YAML declaration and apply further experiment updates with:

`kubectl apply -f network-delay.yaml`{{execute}}

The experiment can be paused:

`kubectl annotate networkchaos web-show-network-delay experiment.chaos-mesh.org/pause=true`{{execute}}

and resumed:

`kubectl annotate networkchaos web-show-network-delay experiment.chaos-mesh.org/pause-`{{execute}}

Since the NetworkChaos is like any other Kubernetes resource, the experiment can be easily removed.

`kubectl delete -f network-delay.yaml`{{execute}}