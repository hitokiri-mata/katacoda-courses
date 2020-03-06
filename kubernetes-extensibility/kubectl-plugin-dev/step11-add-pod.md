Up to this point, you have only queried Kubernetes for information. In this step, you will add a Pod programmatically. You will be working with the `pod_add` file. Find the code that reads `fmt.Printf("adding a pod\n")` and replace with the following:

This step will require the following additions to the imports:

```go
	apiv1 "k8s.io/api/core/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"

	"github.com/codementor/k8s-cli/pkg/example/env"
```{{copy}}

Similar to the first pod list, we need a client and a podClient.

```go
	client := env.NewClientSet(&Settings)

	podsClient := client.CoreV1().Pods(apiv1.NamespaceDefault)
```{{copy}}

Next we need to define the pod using the v1.Pod API.

```go
	pod := &apiv1.Pod{
		ObjectMeta: metav1.ObjectMeta{
			Name:   name,
			Labels: map[string]string{"app": "demo"},
		},
		Spec: apiv1.PodSpec{
			Containers: []apiv1.Container{
				{
					Name:  name,
					Image: p.image,
				},
			},
		},
	}
```{{copy}}

Notice the setting of `Name`, `Image` and `Labels`.

Now create it.
```go
	pp, err := podsClient.Create(pod)
	if err != nil {
		return err
	}

	fmt.Fprintf(p.out, "Pod %v created with rev: %v\n", pp.Name, pp.ResourceVersion)
```{{copy}}

Notice we get another object back from create which contains updates to the object we passed.

Let's check the cluster.

`kubectl get pods`

There they are, the new Pods your created via your plugin!
