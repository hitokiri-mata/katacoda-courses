Run the create command to create a new API (group/version) as cnat/v1alpha1 and the new Kind (CRD) _At_ associated with the API.

```bash
kubebuilder create api \
 --group cnat \
 --version v1alpha1 \
 --kind At
 ```{{execute}}

Answer no ('N') to the two questions for creating a "Resource" and a "Controller".

Familiarize yourself with the generated files.

- `example//main.go`{{open}}
- `example/api/v1alpha1/at_types.go`{{open}}
- `example/controllers/at_controller.go`{{open}}
