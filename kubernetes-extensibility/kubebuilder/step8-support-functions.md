Completing the controller requires adding a couple of support functions for creating the Pod and checking the schedule. Add the following functions to the `controllers/at_controller.go`{{open}} file.

```go
// newPodForCR returns a busybox Pod with the same name/namespace as the CR
func newPodForCR(cr *cnatv1alpha1.At) *corev1.Pod {
	labels := map[string]string{
		"app": cr.Name,
	}
	return &corev1.Pod{
		ObjectMeta: metav1.ObjectMeta{
			Name:      cr.Name + "-pod",
			Namespace: cr.Namespace,
			Labels:    labels,
		},
		Spec: corev1.PodSpec{
			Containers: []corev1.Container{
				{
					Name:    "busybox",
					Image:   "busybox",
					Command: strings.Split(cr.Spec.Command, " "),
				},
			},
			RestartPolicy: corev1.RestartPolicyOnFailure,
		},
	}
}

// timeUntilSchedule parses the schedule string and returns the time until the schedule.
// When it is overdue, the duration is negative.
func timeUntilSchedule(schedule string) (time.Duration, error) {
	now := time.Now().UTC()
	layout := "2006-01-02T15:04:05Z"
	s, err := time.Parse(layout, schedule)
	if err != nil {
		return time.Duration(0), err
	}
	return s.Sub(now), nil
}
```{{copy}}

Finishing the Reconcile function, insert the code below after the if body that sets the `instance.Status.Phase = cnatv1alpha1.PhasePending`:

```go
// Now let's make the main case distinction: implementing
	// the state diagram PENDING -> RUNNING -> DONE
	switch instance.Status.Phase {
	case cnatv1alpha1.PhasePending:
		logger.Info("Phase: PENDING")
		// As long as we haven't executed the command yet, we need to check if it's time already to act:
		logger.Info("Checking schedule", "Target", instance.Spec.Schedule)
		// Check if it's already time to execute the command with a tolerance of 2 seconds:
		d, err := timeUntilSchedule(instance.Spec.Schedule)
		if err != nil {
			logger.Error(err, "Schedule parsing failure")
			// Error reading the schedule. Wait until it is fixed.
			return reconcile.Result{}, err
		}
		logger.Info("Schedule parsing done", "Result", fmt.Sprintf("diff=%v", d))
		if d > 0 {
			// Not yet time to execute the command, wait until the scheduled time
			return reconcile.Result{RequeueAfter: d}, nil
		}
		logger.Info("It's time!", "Ready to execute", instance.Spec.Command)
		instance.Status.Phase = cnatv1alpha1.PhaseRunning
	case cnatv1alpha1.PhaseRunning:
		logger.Info("Phase: RUNNING")
		pod := newPodForCR(instance)
		// Set At instance as the owner and controller
		if err := controllerutil.SetControllerReference(instance, pod, r.Scheme); err != nil {
			// requeue with error
			return reconcile.Result{}, err
		}
		found := &corev1.Pod{}
		err = r.Get(context.TODO(), types.NamespacedName{Name: pod.Name, Namespace: pod.Namespace}, found)
		// Try to see if the pod already exists and if not
		// (which we expect) then create a one-shot pod as per spec:
		if err != nil && errors.IsNotFound(err) {
			err = r.Create(context.TODO(), pod)
			if err != nil {
				// requeue with error
				return reconcile.Result{}, err
			}
			logger.Info("Pod launched", "name", pod.Name)
		} else if err != nil {
			// requeue with error
			return reconcile.Result{}, err
		} else if found.Status.Phase == corev1.PodFailed || found.Status.Phase == corev1.PodSucceeded {
			logger.Info("Container terminated", "reason", found.Status.Reason, "message", found.Status.Message)
			instance.Status.Phase = cnatv1alpha1.PhaseDone
		} else {
			// don't requeue because it will happen automatically when the pod status changes
			return reconcile.Result{}, nil
		}
	case cnatv1alpha1.PhaseDone:
		logger.Info("Phase: DONE")
		return reconcile.Result{}, nil
	default:
		logger.Info("NOP")
		return reconcile.Result{}, nil
	}
```{{copy}}

If you run the controller again make run you should see phase status changing for the CR but it never fully gets to "Done". This is because the controller isn't watching Pods yet.

The final modification is in the SetupWithManager function. Make the following changes:

```go
	return ctrl.NewControllerManagedBy(mgr).
		For(&cnatv1alpha1.At{}).
		Owns(&cnatv1alpha1.At{}).
		Owns(&corev1.Pod{}).
		Complete(r)
```{{copy}}

## Test

To see the fruits of your labor recompile and try the describe command again.

`make install`{{execute}}

`kubectl get ats`{{execute}}
