Let's add another pod list, but using the REST client. Find the code `fmt.Printf("add pod list code using the rest client\n")` in `cmd/kubectl-example/pod_list.go`{{open}} and replace with the following:

Get a client, but first, we are going to use the **REST client**. Look in the `cmd/kubectl-example/environment.go`{{open}} file at the differences.

```go
	client := env.NewRestClient(&Settings)
	result := &v1.PodList{}
```{{copy}}

The REST API is more generic and it is coded using the builder pattern.

```go
	err := client.Get().
		Namespace(apiv1.NamespaceDefault).
		Resource("pods").
		Do().
		Into(result)
	if err != nil {
		return err
	}
```{{copy}}

At this point the `PodList` object is the same and can be displayed the same way as in the first part of this scenario.
```go
	if len(result.Items) == 0 {
		fmt.Printf("no pods discovered\n")
		return nil
	}
	for _, item := range result.Items {
			fmt.Fprintf(p.out, "pod %v in namespace: %v\n", item.Name, item.Namespace)
	}
```{{copy}}

Generate the new plugin.

`make cli`{{execute}}

Test the new Pod listing feature via the plugin.

`kubectl example pod list`{{execute}}

This Pods list is obtained using the REST client calls you just added.
