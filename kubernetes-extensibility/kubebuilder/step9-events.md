This step is extra credit for you. It explores how your Kubebuilder Operator can respond to Kubernetes events. Take a look a the description of the resource.

`kubectl describe at at-sample`{{execute}}

Notice in the description there are no "events" registered for this object. The next step will enable the events listing. In the `example/controllers/at_controller.go`{{open}} file add the Recorder record.EventRecorder to the AtReconciler struct so it looks like:

```go
// AtReconciler reconciles a At object
type AtReconciler struct {
	client.Client
	Log    logr.Logger
	Scheme *runtime.Scheme
	Recorder record.EventRecorder
}
```{{copy}}

This struct is initialized in `example/main.go`{{open}}. Modify this file to the following:

```go
if err = (&controllers.AtReconciler{
		Client:   mgr.GetClient(),
		Log:      ctrl.Log.WithName("controllers").WithName("At"),
		Scheme:   mgr.GetScheme(),
		Recorder: mgr.GetEventRecorderFor("at-controller"),	
```{{copy}}

Now modify the `example/controllers/at_controller.go`{{open}} code to record the events for each transition of the phase status. Below is an example of when the phase is set to "Pending".

r.Recorder.Event(instance, "Normal", "PhaseChange", cnatv1alpha1.PhasePending)

With this new code, the `describe` command will present the list of Kubernetes events on related to the resource.

`kubectl describe at at-sample`{{execute}}

## Imports

The following are the imports needed for the `example/controllers/at_controller.go`{{open}}  for the changes indicated in this lab.

import (
	"context"
	"fmt"
	"strings"
	"time"

	"github.com/go-logr/logr"
	corev1 "k8s.io/api/core/v1"
	"k8s.io/apimachinery/pkg/api/errors"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"k8s.io/apimachinery/pkg/runtime"
	"k8s.io/apimachinery/pkg/types"
	"k8s.io/client-go/tools/record"
	ctrl "sigs.k8s.io/controller-runtime"
	"sigs.k8s.io/controller-runtime/pkg/client"
	"sigs.k8s.io/controller-runtime/pkg/controller/controllerutil"
	"sigs.k8s.io/controller-runtime/pkg/reconcile"

	cnatv1alpha1 "github.com/codementor/cnat/api/v1alpha1"
)
