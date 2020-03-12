## Modify SetupWithManager Function

Make the final modification to the existing SetupWithManager function in `example/controllers/at_controller.go`{{open}} to watch the Pods.

```go
func (r *AtReconciler) SetupWithManager(mgr ctrl.Manager) error {
  return ctrl.NewControllerManagedBy(mgr).
    For(&cnatv1alpha1.At{}).
    Owns(&cnatv1alpha1.At{}).
    Owns(&corev1.Pod{}).
    Complete(r)
}```{{copy}}

By adding the `Pod{}` line this allows the Controller to have visibility into the Pod events.

## Run Controller

To see all the fruits of your labor `Re-run the controller.`{{execute interrupt T2}}

`cd /opt/go/src/example && make run`{{execute T2}}

## Create New At Resource

Create another custom resource with a better schedule. Create an empty YAML file for the new resource.

`touch at-sample-two.yaml`{{execute T1}}

Click on this file `example/at-sample-two.yaml`{{open}} to open it in the editor. Add the following declaration to the opened YAML file in the editor.

```yaml
apiVersion: cnat.my.domain/v1alpha1
kind: At
metadata:
  name: at-sample-two
spec:
  schedule: "paste date string here"
  command: 'echo "Now, I understand: $(date --utc +%FT%TZ)"'
```{{copy}}

Click on the `Copy to Clipboard` icon that follows the text to and paste it into the editor. For the declared schedule time you may want to change the date to a server time a two minutes from now.

`date -d "$(date --utc +%FT%TZ) + 2 min" +%FT%TZ`{{execute}}

Copy the date and paste it into the YAML file. Submit this resource declaration to Kubernetes.

`kubectl apply -f at-sample-two.yaml`{{execute}}

The two At are now listed.

`kubectl get ats`{{execute T1}}

Watch for the new pod busybox Pod to be created by your At controller in a minute or so.

`watch kubectl get pods`{{execute}}

Once the Pod appears this means the schedule has triggered. Once complete use this ```clear```{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>. Check the Status.

`kubectl get ats`{{execute T1}}

Check the events in the resource.

`kubectl describe at at-sample-two`{{execute T1}}
