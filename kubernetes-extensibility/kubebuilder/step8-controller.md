Now that we have a CRD to work with, this next step focuses on the controller to manage these _At_ resources.

Click on this `example/controllers/at_controller.go`{{open}} file to open it in the editor. There are Kuberbuilder markers that define the access control (RBAC) for the CRD, however this controller will need permission for Pods as well.

## Add Imports

This step will be adding some code so replace the whole import block at the top to support the additional code.

```go
import (
  // Core GoLang contexts
  "context"

  // 3rd party and SIG contexts
  "github.com/go-logr/logr"
  "k8s.io/apimachinery/pkg/api/errors"
  "k8s.io/apimachinery/pkg/runtime"
  ctrl "sigs.k8s.io/controller-runtime"
  "sigs.k8s.io/controller-runtime/pkg/client"
  "sigs.k8s.io/controller-runtime/pkg/reconcile"

  // Local Operator contexts
  cnatv1alpha1 "example/api/v1alpha1"
)
```{{copy}}

## Update Reconcile Function

Just above the Reconcile function, find these markers:

```go
// +kubebuilder:rbac:groups=cnat.mydomain.com,resources=ats,verbs=get;list;watch;create;update;patch;delete
// +kubebuilder:rbac:groups=cnat.mydomain.com,resources=ats/status,verbs=get;update;patch
```

and right after those markers add these markers to give the controller Pod management permissions:

```go
// +kubebuilder:rbac:groups=apps,resources=deployments,verbs=get;list;watch;create;update;patch;delete
// +kubebuilder:rbac:groups=apps,resources=deployments/status,verbs=get;update;patch
```{{copy}}

They are just in the form of comment before the function. Follow this link for [Kubebuilder markers](https://book.kubebuilder.io/reference/markers.html) if you are curious.

Continuing with updating the code inside the `Reconcile` function, change the logger to a specific logger name and with some defined structure as follows:

```go
  logger := r.Log.WithValues("namespace", req.NamespacedName, "at", req.Name)
  logger.Info("== Reconciling At")
```{{copy}}

Following these logger lines, add this code block to fetching instances of the CR for At.

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
  }
```{{copy}}

While there is some additional logic you will want to add for working an instance through it's phases, lets follow this up with an update which will define the end of our function just prior to the last return statement.

```go
  // Update the At instance, setting the status to the respective phase:
  err = r.Status().Update(context.TODO(), instance)
  if err != nil {
    return reconcile.Result{}, err
  }
```{{copy}}

## Test

With this new code your controller. test the functionality. Re-create the install to setup new RBAC manifests.

`make install`{{execute}}

Run the controller.

`make run`{{execute T2}}

Request from your controller the list of _at_ resources.

`kubectl get ats`{{execute}}

`kubectl describe at at-sample`{{execute}}

Your new Operator is alive!
