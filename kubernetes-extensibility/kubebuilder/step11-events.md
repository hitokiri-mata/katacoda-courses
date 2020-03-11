This step is extra credit for you. It explores how your Kubebuilder Operator can respond to Kubernetes events. Take a look at the description of the resource.

`kubectl describe at at-sample`{{execute}}

Notice in this description there are no "events" listed (`<none>`) for this object. The next step enables the events listing. In the `example/controllers/at_controller.go`{{open}} file add the Recorder record.EventRecorder to the AtReconciler struct so it looks like:

```go
// AtReconciler reconciles an At object
type AtReconciler struct {
  client.Client
  Log logr.Logger
  Scheme *runtime.Scheme
  Recorder record.EventRecorder
}
```{{copy}}

Where this struct is initialized in the `example/main.go`{{open}} file, add the Recorder line.

```go
if err = (&controllers.AtReconciler {
  Client:   mgr.GetClient(),
  Log:      ctrl.Log.WithName("controllers").WithName("At"),
  Scheme:   mgr.GetScheme(),
  Recorder: mgr.GetEventRecorderFor("at-controller"),
```{{copy}}

Now modify the `example/controllers/at_controller.go`{{open}} code to record the events for each transition of the phase status. Below is an example of when the phase is set to "Pending".

r.Recorder.Event(instance, "Normal", "PhaseChange", cnatv1alpha1.PhasePending)

With this new code, the `describe` command will present the list of Kubernetes events on related to the resource.

`kubectl describe at at-sample`{{execute}}
