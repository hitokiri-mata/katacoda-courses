Another technique used get the same Pod Listing is using the REST client. 

## Add REST Client

At the bottom of the file `k8s-cli/pkg/cmd/pod_list.go`{{open}} in the `run2` function find the code `fmt.Printf("add pod list code using the rest client\n")` and replace with the following:

Get a client, but first, we are going to use the **REST client**. Look in the `k8s-cli/pkg/env/environment.go`{{open}} file at the differences.

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
    fmt.Fprintf(p.out, "(RESTifarian technique:)\n")
	if len(result.Items) == 0 {
		fmt.Printf("no pods discovered\n")
		return nil
	}
	for _, item := range result.Items {
		fmt.Fprintf(p.out, "Pod %v in Namespace: %v\n", item.Name, item.Namespace)
	}
```{{copy}}

# Swap `run` functions

Change the previous function called `run` to something line `runViaCommand` then change function named `run2` to `run`.

# Test

Now the `pods list` use uses the REST client to provide the same Pod list.

`go run cmd/kubectl-example/main.go  pod list`{{execute}}

Generate the new plugin.

`make cli`{{execute}}

Test the new Pod listing feature via the plugin.

`kubectl example pod list`{{execute}}

This Pods list is obtained using the REST client calls you just added.
