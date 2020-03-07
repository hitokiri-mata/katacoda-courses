Run the following command to create a new API (group/version) as cnat/v1alpha1 and the new Kind(CRD) At on it:

```bash
kubebuilder create api \
 --group cnat \
 --version v1alpha1 \
 --kind At
 ```{{execute}}

Review the generated files. `main.go`{{open}} has changed. Review `at_types.go`{{open}} and `at_controller.go`{{open}}.
