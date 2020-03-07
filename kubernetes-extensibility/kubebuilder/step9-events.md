Advanced: Using the kubernete events

Take a look a the description of the resource.

`kubectl describe at at-sample`{{execute}}

Notice there are no "events" against this object. This step of the lab changes that.

Add the Recorder record.EventRecorder to the AtReconciler struct so that it looks like:

```go
// AtReconciler reconciles a At object
type AtReconciler struct {
	client.Client
	Log    logr.Logger
	Scheme *runtime.Scheme
	Recorder record.EventRecorder
}
```

This struct is initialized in main.go, Modify this file to the following:

```go
if err = (&controllers.AtReconciler{
		Client:   mgr.GetClient(),
		Log:      ctrl.Log.WithName("controllers").WithName("At"),
		Scheme:   mgr.GetScheme(),
		Recorder: mgr.GetEventRecorderFor("at-controller"),	
```{{copy}}

Now modify the at_controller.go code to record the events for each transition of the phase status. Below is an example of when the phase is set to "Pending"

r.Recorder.Event(instance, "Normal", "PhaseChange", cnatv1alpha1.PhasePending)

The results of a describe after this modification will now look like:

`kubectl describe at at-sample`{{execute}}


## Imports

The following are the imports needed for the at_controller.go for the changes indicated in this lab.

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
