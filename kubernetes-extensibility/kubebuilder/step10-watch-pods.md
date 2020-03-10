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

By adding the `Pod{}` line this allow the Controller to have visibility into the Pod events.

## Test

To see all the fruits of your labor recompile and try the describe command again.

`make install`{{execute}}

Run the controller again.

`make run`{{execute T2}}

View the results.

`kubectl get ats`{{execute}}

`kubectl describe at at-sample`{{execute}}
