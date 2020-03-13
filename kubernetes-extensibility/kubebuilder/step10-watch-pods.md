## Modify SetupWithManager Function

Make the final modification in `example/controllers/at_controller.go`{{open}} to the existing SetupWithManager function at the bottom of the code. These modifications will allow the controller to watch the Pods.

```go
func (r *AtReconciler) SetupWithManager(mgr ctrl.Manager) error {
  return ctrl.NewControllerManagedBy(mgr).
    For(&cnatv1alpha1.At{}).
    Owns(&cnatv1alpha1.At{}).
    Owns(&corev1.Pod{}).
    Complete(r)
}```{{copy}}

By adding the `Pod{}` line this allows the Controller to have visibility into the Pod events.

# Test

With this new code your controller, test the new functionality.

`make install`{{execute}}

`Terminate the running controller.`{{execute interrupt T2}}

Start the new controller your just modified.

`make run`{{execute T2}}

View the results.

`kubectl get ats`{{execute T1}}

Notice, now the Status column has changed from `RUNNING` to `DONE`. Check the events.

`kubectl describe at at-sample`{{execute T1}}

The description is also reporting `DONE`. However, notice at the end the Events reports `<none>`. You will work these items next.





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
