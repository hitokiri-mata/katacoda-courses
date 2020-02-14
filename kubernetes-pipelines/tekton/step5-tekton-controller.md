## Install Tekton Controller

Install Tekton

`kubectl apply --filename https://storage.googleapis.com/tekton-releases/latest/release.yaml`{{execute}}

Verify the Tekton is running.

`watch kubectl get deployments,pods,services --namespace tekton-pipelines`{{execute}}

After a few seconds the Pod will move to the _running_ state and the Deployments will move to the _available (1)_ state. Once complete use this ```clear```{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

New Custom Resources have been defined for Tekton

`kubectl get crds`{{execute}}

`kubectl get pipelines`{{execute}}