## Modify SetupWithManager Function

Make the final modification to the existing SetupWithManager function to watch the Pods.

```goat 
  return ctrl.NewControllerManagedBy(mgr).
    For(&cnatv1alpha1.At{}).
    Owns(&cnatv1alpha1.At{}).
    Owns(&corev1.Pod{}).
    Complete(r)
```{{copy}}

## Test

To see all the fruits of your labor recompile and try the describe command again.

`make install`{{execute}}

Run the controller again.

`make run`{{execute}}

View the results.

`kubectl get ats`{{execute}}

`kubectl get at at-sample`{{execute}}
