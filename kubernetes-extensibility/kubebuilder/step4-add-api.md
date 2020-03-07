Run the create command to create a new API (group/version) as cnat/v1alpha1 and the new Kind (CRD) _At_ associated with the API.

```bash
kubebuilder create api \
 --group cnat \
 --version v1alpha1 \
 --kind At
 ```{{execute}}

Review the generated files. `todo/main.go`{{open}} has changed. Review `api/v1alpha1/at_types.go`{{open}} and `controllers/at_controller.go`{{open}}.
