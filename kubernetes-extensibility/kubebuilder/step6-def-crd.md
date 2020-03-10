In this step you will code some details for the CRD and create a CRD on yuor cluster. Currently there are no CRDs defined.

`kubectl get crds`{{execute}}

## Modify Structs

Click on this `example/api/v1alpha1/at_types.go`{{open}} file to open it in the editor.

The goal is to change the Spec and Status for the CRD. This requires changes to `AtSpec struct` and `AtStatus struct` respectively.

For the `AtSpec struct`, add `Schedule` and `Command`, both as strings. Remove the line with `Foo` in it.

```go
  // Specifications for "at" scheduling
  Schedule string `json:"schedule,omitempty"`
  Command string `json:"command,omitempty"`
```
{{copy}}

You can either type in the YAML file (best way to learn) or click on the `Copy to Clipboard` icon that follows the text to and paste it into the editor. Any changes are saved automatically.

Just below, for the `AtStatus struct`, add a string variable named `Phase`.

```go
  // Specifications for "at" status
  Phase string `json:"phase,omitempty"`
```
{{copy}}

## Add Phase Constants

To complete the types definition, and for controller convenience, define the following phases in the same `example/api/v1alpha1/at_types.go`{{open}} file.

```go
const (
  PhasePending = "PENDING"
  PhaseRunning = "RUNNING"
  PhaseDone    = "DONE"
)
```
{{copy}}

Add this `const` section just after the `structs` you just modified.

## Build

With these modifications build and generate files in the config folder.

`make manifests`{{execute}}

Apply the CRDs to your running Kubernetes cluster.

`make install`{{execute}}

## Test

With these updates, ensure the updated controller and CRDs for `At` are installed.

`kubectl get crds`{{execute}}

You now new Kubernetes resource type. Further details about hte resource can also be explored.

`kubectl describe crd ats.cnat.my.domain`{{execute}}

In the next step you will create a new `at` resource.
