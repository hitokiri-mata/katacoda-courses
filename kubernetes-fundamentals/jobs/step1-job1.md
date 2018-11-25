# Run Single Job #

Ensure Minikube is running and ready to accept your upcoming declarations.

`minikube status`{{execute}}

Use the Kubectl _run_ command as a simple way to create a Job. This command runs the Job in the form of a Pod that contains a single container. The app in the container simply generates security keys.

`kubectl run -i oneshot --image=gcr.io/kuar-demo/kuard-amd64:1 --restart=OnFailure -- --keygen-enable --keygen-exit-on-complete --keygen-num-to-gen 10`{{execute}}

Once the job is complete the Pod and container are no longer running, but are still present and its state and logs can be inspected.

Use the _get_ command to list of current jobs.

`kubectl get jobs`{{execute}}

Once you are done inspecting the job, use the _delete_ command to remove it.

`kubectl delete jobs oneshot`{{execute}}

This steps explored starting a job with just a command. The next step will run the same job, but from a resource defined in a YAML.