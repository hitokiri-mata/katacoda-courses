# Deploy Python Function #

To deploy a function use the kubeless CLI tool. To deploy a function some fundamental information is provided:

- Name of the function
- [Language and version](https://kubeless.io/docs/runtimes/) that Kubeless needs to provide to run the function
- The function source code
- The exposed handle name to be associated with the function
- How the function will be invoked (default HTP trigger)

`kubeless function deploy fibonacci --runtime python3.6 \ --handler fibonacci.handler \ --from-file fibonacci.py`{{execute}}

You can then list the function with the kubeless CLI:

`kubeless function ls`{{execute}}

While the function is deploying inspect the actual Python function source code:

`cat fibonacci.py`{{execute}}

With the deploy command, Kubeless automatically created a Kubernetes deployment and service for your function. Observe that a Pod containing your function is running:

`kubectl get pods`{{execute}}

## Special Sauce ##

The Kubeless secret sauce is your function's source code is deployed into a Kubernetes ConfigMap. You can view the deployed code here:

'kubectl get configmaps'{{execute}}

On deployment _Kubeless_ starts a pre-baked container containing the Python executable, then your function's source code is referenced from the ConfigMap and injected into the Python container. In turn, the container is fronted by a Kubernetes Service where you can invoke the function from a Service call. Inspect the Service with this command:

TODO: 'kubectl get service'{{execute}}  

