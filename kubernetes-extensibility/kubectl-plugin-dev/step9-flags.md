Often with commands, like `Pods` you may want to add a command flag (or switch). In this step you will add a flag for filtering on Pod status when using the `pods` command.

In the same file `cmd/kubectl-example/pod_list.go`{{open}}:

- Find where it reads `// status boolean` and add the following code `status bool`{{copy}} to the struct.
- Find where it reads `// status flag` and add the following code to add as a flag.

```go
	f := cmd.Flags()
	f.BoolVarP(&pkg.status, "status", "i", true, "display status info")

```{{copy}}

Next, change the previous steps code such that a flag will provide a different output.

```go
		if p.status {
			fmt.Fprintf(p.out, "pod %v in namespace: %v, status: %v\n", item.Name, item.Namespace, item.Status.Phase)

		} else {

```{{copy}}

Now the `pods --status` flag will provide additional output for the list.

`go run cmd/kubectl-example/main.go  pod list --status`{{execute}}

Generate the new plugin.

`make cli`{{execute}}

Test the new Pod listing feature via the plugin.

`kubectl example pod list`{{execute}}

```
