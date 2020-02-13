## Install Tekton Controller

Install Tekton

`kubectl apply --filename https://storage.googleapis.com/tekton-releases/latest/release.yaml`{{execute}}

Verify the Tekton is running.

`watch kubectl get deployments,pods,services --namespace tekton-pipelines`{{execute}}

Ctrl-C.

New Custom Resources have been defined for Tekton

`kubectl get crds`{{execute}}

`kubectl get pipelines`{{execute}}