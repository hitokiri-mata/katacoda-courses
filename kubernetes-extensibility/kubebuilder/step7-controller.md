Now that we have a CRD to work with let's focus on the controller to manage these _At_ resources.

Click on this `example/controllers/at_controller.go`{{open}} file to open it in the editor. There are two tags to generate RBAC for the CRD, however this controller will need permission for Pods as well.

find:

```go
// +kubebuilder:rbac:groups=cnat.d2iq.com,resources=ats,verbs=get;list;watch;create;update;patch;delete
// +kubebuilder:rbac:groups=cnat.d2iq.com,resources=ats/status,verbs=get;update;patch
```

and add:

```go
// +kubebuilder:rbac:groups=apps,resources=deployments,verbs=get;list;watch;create;update;patch;delete
// +kubebuilder:rbac:groups=apps,resources=deployments/status,verbs=get;update;patch
```{{copy}}

Follow this link for [Kubebuilder markers](https://book.kubebuilder.io/reference/markers.html) if you are curious.

Working on the func (r *AtReconciler) Reconcile function, change the logger to a specific logger name and with some defined structure as follows:

```go
	logger := r.Log.WithValues("namespace", req.NamespacedName, "at", req.Name)
	logger.Info("== Reconciling At")
```{{copy}}

Following these logger line, add this code to fetching instances of the CR for At.

```go
	// Fetch the At instance
	instance := &cnatv1alpha1.At{}
	err := r.Get(context.TODO(), req.NamespacedName, instance)
	if err != nil {
		if errors.IsNotFound(err) {
			// Request object not found, could have been deleted after reconcile request - return and don't requeue:
			return reconcile.Result{}, nil
		}
		// Error reading the object - requeue the request:
		return reconcile.Result{}, err
	}
```{{copy}}

Now that we have an instance defined by the request namespacedname, check to see if it has a status, if not, let's initialize.

```go
  // If no phase set, default to pending (the initial phase):
  if instance.Status.Phase == "" {
    instance.Status.Phase = cnatv1alpha1.PhasePending
    cnatv1alpha1.PhasePending)
  }
```{{copy}}

While there is some additional logic you will want to add for working an instance through it's phases, lets follow this up with an update which will define the end of our function just prior to a return.

```go
  // Update the At instance, setting the status to the respective phase:
  err = r.Status().Update(context.TODO(), instance)
  if err != nil {
	return reconcile.Result{}, err
  }

  return ctrl.Result{}, nil
```{{copy}}

## Test

With this new code your controller. test the functionality. Re-create the install to setup new RBAC manifests.

`make install`{{execute}}

Run the controller.

`make run`{{execute}}

Request from your controller the list of _at_ resources.

`kubectl get at`{{execute}}
