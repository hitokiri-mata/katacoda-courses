There is a sample HelloWork function written in and can be inspected.

`export HELLO_SRC=https://raw.githubusercontent.com/nuclio/nuclio/master/hack/examples/golang/helloworld/helloworld.go`{{execute}}

`curl $HELLO_SRC`{{execute}}

Deploy the function to Nuclio on Kubernetes.

`nuctl deploy helloworld  -n nuclio -p $HELLO_SRC --registry $REGISTRY`{{execute}}

Execute the new function.

`nuctl invoke -n nuclio helloworld`{{execute}}

Go back to the portal and inspect and run it from there as well.
