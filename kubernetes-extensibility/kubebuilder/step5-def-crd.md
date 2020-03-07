In this step you will code some details for the CRD.

## Modify

Click on this `api/v1alpha1/at_types.go`{{open}} file to open it in the editor. We want to change the Spec and Status similar to the CRD lab. This requires changes to AtSpec and AtStatus respectively. You'll notice a defined Foo in Spec which should be removed.

For AtSpec add Schedule and Command both are strings. You will need the json... annotation and can use the generated Foo as an example.

For AtStatus you need to add a string variable named Phase.

To complete the types definition and for controller convenience define the following phases in the `api/v1alpha1/at_types.go`{{open}} file.

const (
	PhasePending = "PENDING"
	PhaseRunning = "RUNNING"
	PhaseDone    = "DONE"
)

## Build

With these modifications you are ready to build.

`make manifests`{{execute}}

## Test
This will generate files in the config folder AND/OR make install which will apply the CRDs to your running Kubernetes cluster. After make install ensure the CRD for `At` is installed.

`kubectl get crds`{{execute}}
