You goal is to apply a HPA declaration to instruct the HPA controller on what is should scale.

Inspect the YAML manifest.

`cat hpa.yaml`{{execute T1}}

Apply these HPA rules.

`kubectl apply -f hpa.yaml`{{execute T1}}

However, for this puzzler, something is wrong.

> For this puzzler, try editing the hpa.yaml file with `edit` (vi, vim) and try to correct the syntax error. In the vi editor type 'I' for insert, make you edit, and type esc + ':' then `wq` to save and exit. Once corrected, try again.

>> Vi is my favorite text editor. I've been using it for years...I can't figure out how to exit. `¯\_(ツ)_/¯`

Try again.

`kubectl apply -f hpa.yaml`{{execute T1}}

Still getting and error, re-edit the YAML. If the command was successful inspect the new HPA object.

`kubectl get hpa`{{execute T1}}

Inspect the state of the HPA with the describe command.

`kubectl describe hpa php-apache`{{execute T1}}

If the HPA resource is not present, then something is still wrong. Once the HPA is successfully submitted, the Continue button will allow you to move to the next step.
