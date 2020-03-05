Command Flags and Pod Status

Lets add a new command flag for this list command.

Find in the `pod_list.go` file where it reads `// status boolean` and add the following code `status bool` to the struct.

Find in the `pod_list.go` file where it reads `// status flag` and add the following code to add a flag 

```go
	f := cmd.Flags()
	f.BoolVarP(&pkg.status, "status", "i", true, "display status info")

```

Now lets change the previous steps code such that a flag will provide a different output.

```go
		if p.status {
			fmt.Fprintf(p.out, "pod %v in namespace: %v, status: %v\n", item.Name, item.Namespace, item.Status.Phase)

		} else {

```

Now a `--status` flag will provide additional output for the list.

```bash
go run cmd/kubectl-example/main.go  pod list --status
pod at-sample2-pod in namespace: default, status: Succeeded
pod foo in namespace: default, status: Running
```
