In this step you will code some details for the CRD.

## Modify

Click on this `api/v1alpha1/at_types.go`{{open}} file to open it in the editor. Change the Spec and Status. This requires changes to _AtSpec_ and _AtStatus_ respectively. You'll notice a defined _Foo_ in _AtSpec_ which should be removed.

For _AtSpec_ add _Schedule_ and _Command_, both are strings. You will need the json... annotation and can use the generated _Foo_ as an example.

For _AtStatus_ you need to add a string variable named `Phase`.

To complete the types definition and for controller convenience define the following phases in the `api/v1alpha1/at_types.go`{{open}} file.

```go
const (
	PhasePending = "PENDING"
	PhaseRunning = "RUNNING"
	PhaseDone    = "DONE"
)
```{{copy}}

## Build

With these modifications you are ready to build and generate files in the config folder.

`make manifests`{{execute}}

Apply the CRDs to your running Kubernetes cluster.

'make install`{{execute}}

## Test

With these updates, ensure the updated controller for `At` resources is installed.

`kubectl get crds`{{execute}}
