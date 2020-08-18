In this step, you will code some details for the CRD that will subsequently create a CRD on your cluster. Currently, there are no CRDs defined:

`kubectl get crds`{{execute}}

This message is expected:

`No resources found in default namespace.`

## Modify Structs

Click to open the `example/api/v1alpha1/at_types.go`{{open}} file in the editor.

In this step, we will change the Spec and Status for the CRD. This requires changes to `AtSpec struct` and `AtStatus struct` respectively.

# AtSpec

For the `AtSpec struct`, add `Schedule` and `Command`, both as strings. Here is the new AtSpec to replace the existing one:

```go
// AtSpec defines the desired state of an At resource
type AtSpec struct {
  // INSERT ADDITIONAL SPEC FIELDS - desired state of cluster
  // Important: Run "make" to regenerate code after modifying this file

  // Specifications for "at" scheduling
  Schedule string `json:"schedule,omitempty"`
  Command string `json:"command,omitempty"`
}```{{copy}}

> You can either type in the new lines (that's the best way to learn) or click the `Copy to Clipboard` icon that follows the text to and paste it into the editor. Any changes are saved automatically.

# AtStatus

Just below, for the `AtStatus struct`, replace the struct with this struct that has the added string variable named `Phase`:

```go
// AtStatus defines the observed state of At
type AtStatus struct {
	// INSERT ADDITIONAL STATUS FIELD - define observed state of cluster
	// Important: Run "make" to regenerate code after modifying this file
  Phase string `json:"phase,omitempty"`
}```{{copy}}

## Add Phase Constants

To complete the types definition, and for controller convenience, define the following phases in the same `example/api/v1alpha1/at_types.go`{{open}} file just below the AtStatus struct:

```go
const (
  PhasePending = "PENDING"
  PhaseRunning = "RUNNING"
  PhaseDone    = "DONE"
)
```{{copy}}

## Build

With these modifications, build and generate files in the config folder:

`make manifests`{{execute}}

Apply the CRDs to your running Kubernetes cluster:

`kubectl kustomize config/crd | kubectl apply -f -`{{execute}}

For the above command there there is an `install` task in the Makefile with a slightly older version of using kustomize. Now, kustomize is built into kubectl.

## Test

With these updates, ensure the updated controller and CRDs for `at` are installed:

`kubectl get crds`{{execute}}

You now have a new Kubernetes resource type and can explore further details about the resource:

`kubectl describe crd ats`{{execute}}

In the next step, you will create a new `at` resource.
