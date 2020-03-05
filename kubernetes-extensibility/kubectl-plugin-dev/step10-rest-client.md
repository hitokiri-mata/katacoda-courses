Using Rest Client

Lets add another pod list, but using the rest client. Find the code `fmt.Printf("add pod list code using the rest client\n")` in `pod_list.go` and replace with the following:

First lets get a client, but in this case we are going to use the rest client. Look in the `environment.go` file at the differences.

```go
	client := env.NewRestClient(&Settings)
	result := &v1.PodList{}
```

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
```

At this point the `PodList` object is the same and can be displayed the same way as in the first part of this lab.
```go
	if len(result.Items) == 0 {
		fmt.Printf("no pods discovered\n")
		return nil
	}
	for _, item := range result.Items {
			fmt.Fprintf(p.out, "pod %v in namespace: %v\n", item.Name, item.Namespace)
	}
```
