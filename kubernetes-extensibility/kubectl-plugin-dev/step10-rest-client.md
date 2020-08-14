Another technique that gets the same Pod listing is using the REST client. 

Currently, if you list the Pods with the alternate `list2` function it returns just a placeholder message:

`kubectl example pod list2`{{execute}}

## Add REST Client

At the bottom of the file `k8s-cli/pkg/example/cmd/pod_list.go`{{open}} in the `run2` function, find the code line `fmt.Printf("add pod list code using the rest client\n")` and replace it with the following three code snippets in sequence:

1. Access the REST client.
```go
  // 
  client := env.NewRestClient(&Settings)
  result := &apiv1.PodList{}
```{{copy}}

The definition for this `NewRestClient` is near line 70 in `pkg/example/env/environment.go`{{open}}.

2. Using the REST client get the Pods. You can see the REST API is more generic and is coded using the builder pattern:

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

3. List the Pods. At this point the `PodList` object is the same as the list in first `run` function and can be listed the same way:
```go
  fmt.Fprintf(p.out, "RESTifarian technique\n")
  if len(result.Items) == 0 {
    fmt.Printf("no pods discovered\n")
    return nil
  }
  for _, item := range result.Items {
    fmt.Fprintf(p.out, "Pod %v in Namespace: %v\n", item.Name, item.Namespace)
  }
```{{copy}}

# Test

Now the `pod list2` uses the REST client to provide the same Pod list:

`go run cmd/kubectl-example/main.go pod list2`{{execute}}

Generate the new plugin:

`make cli-install`{{execute}}

Test the new Pod listing feature via the plugin:

`kubectl example pod list2`{{execute}}

This Pods list is obtained using the REST client calls you just added.
