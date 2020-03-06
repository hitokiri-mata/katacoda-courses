Currently, if you test the Pod listing feature it returns a placeholder message.

`kubectl example pod list`{{execute}}

 We want it to instead return a list of Pods. This step will add some code that enumerates the Pods. The Pods will be in a list of [structure object](https://www.golangprograms.com/go-language/struct.html) references.

Click on this file to open it in the editor `k8s-cli/cmd/kubectl-example/pod_list.go`{{open}}. Near line 67 replace the placeholder message `fmt.Printf("add pod list code using direct object references\n")` with the following:

```go
	// Acquire a kube client and a pods client
	client := env.NewClientSet(&Settings)
	podsClient := client.CoreV1().Pods(apiv1.NamespaceDefault)

	// Query pod clients for a list of pods
	list, err := podsClient.List(metav1.ListOptions{})
	if err != nil {
		return err
	}
```{{copy}}

You can use the `Copy to Clipboard` button to make it easier.

The return list is an object that has type information AND contains a list of theobjects we are interested in. This is a common pattern in Kubernetes object access. Next, append this additional code that checks to see if there are any objects and prints a line for each Pod found.

```go
	if len(list.Items) == 0 {
		fmt.Printf("No pods discovered.\n")
		return nil
	}
	for _, item := range list.Items {
		fmt.Fprintf(p.out, "pod %v in namespace: %v\n", item.Name, item.Namespace)
	}
```{{copy}}

Generate the new plugin.

`make cli`{{execute}}

Test the new Pod listing feature via the plugin.

`kubectl example pod list`{{execute}}
