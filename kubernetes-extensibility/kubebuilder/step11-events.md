This step is extra credit for you. It explores how your Kubebuilder Operator can respond to Kubernetes events. Take a look at the description of the resource.

`kubectl describe at at-sample`{{execute}}

Notice in this description there are no "events" listed (`<none>`) for this object. The next instructions enables the events listing.

## Controller Changes for Events

Make the following modification to the `example/controllers/at_controller.go`{{open}} file.

### Add Import

Add the Record context to the import list at the top.

`  "k8s.io/client-go/tools/record"`{{copy}}

### Add EventRecorder

Add the Recorder line to the struct.

```go
// AtReconciler reconciles an At object
type AtReconciler struct {
  client.Client
  Log logr.Logger
  Scheme *runtime.Scheme
  Recorder record.EventRecorder
}
```{{copy}}

Now modify the `example/controllers/at_controller.go`{{open}} code to record the events for each transition of the phase status. You will want to add each of these recording instructions to the respective case in the switch statements.

For `case cnatv1alpha1.PhasePending:`

`r.Recorder.Event(instance, "Normal", "PhaseChange", cnatv1alpha1.PhasePending)`{{copy}}

For `case cnatv1alpha1.PhaseRunning:`

`r.Recorder.Event(instance, "Running", "PhaseChange", cnatv1alpha1.PhaseRunning)`{{copy}}

For `case cnatv1alpha1.PhaseDone:`

`r.Recorder.Event(instance, "Done", "PhaseChange", cnatv1alpha1.PhaseDone)`{{copy}}


## Main Change for Events

Where this struct is initialized in the `example/main.go`{{open}} file, add the Recorder line.

```go
if err = (&controllers.AtReconciler {
  Client:   mgr.GetClient(),
  Log:      ctrl.Log.WithName("controllers").WithName("At"),
  Scheme:   mgr.GetScheme(),
  Recorder: mgr.GetEventRecorderFor("at-controller"),
```{{copy}}

# Test

With this new code, the `describe` command will present the list of Kubernetes events on related to the resource.

`kubectl describe at at-sample`{{execute}}