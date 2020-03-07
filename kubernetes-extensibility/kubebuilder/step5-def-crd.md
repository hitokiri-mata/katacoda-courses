In this step you will code some details for the CRD.

## Modify Structs

Click on this `example/api/v1alpha1/at_types.go`{{open}} file to open it in the editor. 

The goal is to change the Spec and Status for the CRD. This requires changes to `AtSpec struct` and `AtStatus struct` respectively.

For `AtSpec struct` add `Schedule` and `Command`, both are strings. Remove the Foo line.

```go
  // Specifications for "at" scheduling
  Schedule string `json:"schedule,omitempty"`
  Command string `json:"command,omitempty"`
```{{copy}}

For `AtStatus struct` you add a string variable named `Phase`.

```go
  // Specifications for "at" status
  Phase string `json:"phase,omitempty"`
```{{copy}}

## Add Phase Constants

To complete the types definition and for controller convenience define the following phases in the same `example/api/v1alpha1/at_types.go`{{open}} file.

```go
const (
	PhasePending = "PENDING"
	PhaseRunning = "RUNNING"
	PhaseDone    = "DONE"
)
```{{copy}}

Add this `const` section just after the `structs` you just modified.

## Build

With these modifications you are ready to build and generate files in the config folder.

`make manifests`{{execute}}

Apply the CRDs to your running Kubernetes cluster.

`make install`{{execute}}

## Test

With these updates, ensure the updated controller for `At` resources is installed.

`kubectl get crds`{{execute}}
