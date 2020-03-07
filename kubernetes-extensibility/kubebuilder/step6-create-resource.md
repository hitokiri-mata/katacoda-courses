Create a custom resource based on this new `At` CRD.

Create a YAML file.

`touch at-sample.yaml`{{echo}}

Click on this file `at-sample.yaml`{{open}} to open it in the editor. Add this text to the opened YAML file in the editor.

```yaml
apiVersion: cnat.my.domain/v1alpha1
kind: At
metadata:
  name: at-sample
spec:
  schedule: "2020-01-30T10:02:00Z"
  command: "echo YAY"
```{{copy}}

You can either type in the YAML file (best way to learn) or click on the `Copy to Clipboard` icon that follows the text to and paste it into the editor.

## Advanced: Printer Columns

How about adding a printer column? The following build tags can be placed before type `At struct`.

```yaml
// +kubebuilder:object:root=true
// +kubebuilder:subresource:status
// +kubebuilder:printcolumn:JSONPath=".spec.schedule", name=Schedule, type=string
// +kubebuilder:printcolumn:JSONPath=".status.phase", name=Phase, type=string
// At is the Schema for the ats API
type At struct {
    metav1.TypeMeta   `json:",inline"`
```{{copy}}

Reinstall the manifests.

`make install`{{execute}}

Retrieve the custom resource.

`kubectl get ats`{{execute}}

The new print column appears.
