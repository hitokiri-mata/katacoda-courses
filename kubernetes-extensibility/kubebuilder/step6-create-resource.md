Create a custom resource based on this new `At` CRD.

To start, create an empty YAML file.

`touch at-sample.yaml`{{execute}}

Click on this file `example/at-sample.yaml`{{open}} to open it in the editor. Add this text to the opened YAML file in the editor.

```yaml
apiVersion: cnat.my.domain/v1alpha1
kind: At
metadata:
  name: at-sample
spec:
  schedule: "2020-01-30T10:02:00Z"
  command: "echo 'I think I get this.'"
```{{copy}}

You can either type in the YAML file (best way to learn) or click on the `Copy to Clipboard` icon that follows the text to and paste it into the editor. Notice the `at` specification where the command and date is specified. For the declares schedule time you may want to change the it to a server time a few minutes from now.

`date -d "$(date --utc +%FT%TZ) + 10 min" +%FT%TZ`{{execute}}

You can always come back to the file, edit the time and reapply the request.

Submit this resource declaration to Kubernetes.

`kubectl apply -f at-sample.yaml`{{execute}}`

## Add Printer Column for Phase

How about adding a printer column? In the `example/at-sample.yaml`{{open}} file, replace the `At struct` so is has the added Kubebuilder markers (as comments) placed above the struct block.

```yaml
// +kubebuilder:object:root=true
// +kubebuilder:subresource:status
// +kubebuilder:printcolumn:JSONPath=".spec.schedule", name=Schedule, type=string
// +kubebuilder:printcolumn:JSONPath=".status.phase", name=Phase, type=string
// At is the Schema for the ats API
type At struct {
	metav1.TypeMeta   `json:",inline"`
	metav1.ObjectMeta `json:"metadata,omitempty"`

	Spec   AtSpec   `json:"spec,omitempty"`
	Status AtStatus `json:"status,omitempty"`
}```{{copy}}

Reinstall the manifests.

`make install`{{execute}}

Retrieve the custom resource.

`kubectl get ats`{{execute}}

The new print column appears.
