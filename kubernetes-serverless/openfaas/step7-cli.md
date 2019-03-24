OpenFaaS is now ready to do some work. You can quickly get started by registering some pre-built functions by submitting a stack YAML file that defines a collection of functions. See how these pre-defined functions are declared.

`curl https://raw.githubusercontent.com/openfaas/faas/master/stack.yml`{{execute}}

Submit this declaration to OpenFaaS and the functions will be available.

`faas-cli deploy -f https://raw.githubusercontent.com/openfaas/faas/master/stack.yml`{{execute}}

View the functions that were just submitted.

`faas-cli list --verbose`{{execute}}

One of the functions is _Markdown_. Here are two ways to invoke the function.

`echo Hi | faas-cli invoke markdown`{{execute}}

If this command does not come back readily, then it's still initializing and probably stuck. If stuck, Ctrl-C and try again.

`uname -a | faas-cli invoke markdown`{{execute}}

Notice how OpenFaaS tracks how many times the markdown function was invoked in the _Invocations_ column.

`faas-cli list --verbose`{{execute}}

The _Replicas_ columns relates to performance and scaling that will be explored in an upcoming step.

## Kubernetes Resources ##

In Kubernetes notice all these functions are now represented by deployments in the openfaas-fn namespace.

`kubectl get deployments --namespace openfaas-fn`{{execute}}

Additionally, they all have services load balancing for the function pods.

`kubectl get service --namespace openfaas-fn`{{execute}}