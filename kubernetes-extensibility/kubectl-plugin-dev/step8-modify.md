Step 6: Add pod listing code which uses structure object references in go.

At line 71 of `pod_list.go` replace `fmt.Printf("add pod list code using direct object references\n")` with the following:

First acquire a kube client and a pods client:

```go
	client := env.NewClientSet(&Settings)
	podsClient := client.CoreV1().Pods(apiv1.NamespaceDefault)
```

With the `podClient` we can query for a list

```go
	list, err := podsClient.List(metav1.ListOptions{})
	if err != nil {
		return err
	}
```

The list that is return is an object which has type information AND contains a list of the pod objects we are interested in. This is a common pattern in kubernetes object access. The follow code checks to see if there are any objects and prints a line for each pod found.

```go
	if len(list.Items) == 0 {
		fmt.Printf("no pods discovered\n")
		return nil
	}
	for _, item := range list.Items {
			fmt.Fprintf(p.out, "pod %v in namespace: %v\n", item.Name, item.Namespace)		
	}
```
