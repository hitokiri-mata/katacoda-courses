Now that we have a CRD to work with, this step focuses on the controller to manage these `At` resources.

Click `example/controllers/at_controller.go`{{open}} to open it in the editor. There are Kuberbuilder markers that define the access control (RBAC) for the CRD, however, this controller will need permission for Pods as well.

## Add Imports

In this step, we will be adding some code to replace the whole import block at the top to support the additional code:

```go
import (
  // Core GoLang contexts
  "context"

  // 3rd party and SIG contexts
  "github.com/go-logr/logr"
  "k8s.io/apimachinery/pkg/api/errors"
  "k8s.io/apimachinery/pkg/runtime"
  "sigs.k8s.io/controller-runtime/pkg/client"
  "sigs.k8s.io/controller-runtime/pkg/reconcile"
  ctrl "sigs.k8s.io/controller-runtime"

  // Local Operator contexts
  cnatv1alpha1 "example/api/v1alpha1"
)
```{{copy}}

## Update Reconcile Function

### Add Markers

Just above the Reconcile function, find these markers:

```go
// +kubebuilder:rbac:groups=cnat.mydomain.com,resources=ats,verbs=get;list;watch;create;update;patch;delete
// +kubebuilder:rbac:groups=cnat.mydomain.com,resources=ats/status,verbs=get;update;patch
```

Right after those markers add two new markers to give the controller Pod management permission:

```go
// +kubebuilder:rbac:groups=apps,resources=deployments,verbs=get;list;watch;create;update;patch;delete
// +kubebuilder:rbac:groups=apps,resources=deployments/status,verbs=get;update;patch
```{{copy}}

They are just in the form of comment before the function. Follow this link for [Kubebuilder markers](https://book.kubebuilder.io/reference/markers.html) to learn more.

### Change Logger

Continuing with updating the code inside the `Reconcile` function, change this logger line:

`	_ = r.Log.WithValues("at", req.NamespacedName)`

to a specific logger name with some defined structure as follows:

```go
  logger := r.Log.WithValues("namespace", req.NamespacedName, "at", req.Name)
  logger.Info("== Reconciling At")
```{{copy}}

### Fetching At Instance

Following these logger lines, add this code block to fetching instances of the CR for At:

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

### Check Phase Value

Now that we have an instance defined by the request `NamespacedName`, add this logic:

```go
  // If no phase set, default to pending (the initial phase):
  if instance.Status.Phase == "" {
    instance.Status.Phase = cnatv1alpha1.PhasePending
  }
```{{copy}}

This will check to see if the Phase has a status, and if not, it will be initialized.

### Update Status

Finish the Reconcile function with an update to the resource status just prior to the last return statement:

```go
  // Update the At instance, setting the status to the respective phase:
  err = r.Status().Update(context.TODO(), instance)
  if err != nil {
    return reconcile.Result{}, err
  }
```{{copy}}

There is some additional logic you will want to add for working an instance through its phases, however, it's time to test again.

## Test

With this new code your controller, test the functionality. Setup the new RBAC by reinstalling the manifests:

`kubectl kustomize config/crd | kubectl apply -f -`{{execute}}

`echo "Terminate the running controller."`{{execute interrupt T2}}

Start the new controller you just modified:

`make run`{{execute T2}}

Request the list of `At` resources from your controller:

`kubectl get ats`{{execute T1}}

Great, your new Operator is alive! Notice now the `PHASE` now has the value `PENDING`:

`kubectl describe at at-sample`{{execute T1}}

The description shows the phase state as well, and the phase is still pending. Notice there are no Pods started:

`kubectl get pods`{{execute}}

In the next step, you will work on getting the phase to advance to `RUNNING`.
