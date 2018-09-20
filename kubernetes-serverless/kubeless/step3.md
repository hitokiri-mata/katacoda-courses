# Deploy Python Function #

To deploy a function, the Kubeless CLI tool needs some information:

- Name of the function
- [Language and version](https://kubeless.io/docs/runtimes/) that Kubeless needs to provide to run the function
- The function source code
- The exposed handle name to be associated and used to invoke the function
- How the function will be invoked (default HTTP trigger)

`kubeless function deploy fibonacci --runtime python3.6 --handler fibonacci.values --from-file fibonacci.py`{{execute}}

You can list the new function with the kubeless CLI:

`kubeless function list`{{execute}}

While the function is deploying inspect the actual Python function source code:

`cat fibonacci.py`{{execute}}

With the deploy command, Kubeless automatically created a Kubernetes deployment and service for your function. Observe that a Deployment< Pod> containing your function is running and exposed as a service in the defaukt namespace:

`kubectl get deployments,pods,services`{{execute}}

## Special Sauce ##

The _Kubeless_ secret sauce is your function's source code is deployed into a Kubernetes ConfigMap. The ConfigMap contents is listed with this:

`kubectl get configmaps`{{execute}}

You can view ConfigMap and see the the deployed code here:

`kubectl describe configmap fibonacci`{{execute}}

On deployment _Kubeless_ starts a pre-baked container containing the Python executable, then your function's source code is referenced from the ConfigMap and injected into the Python container. In turn, the container is fronted by a Kubernetes Service where you can invoke the function from a Service call. Inspect the Service with this command:

TODO: 'kubectl get services'{{execute}}  

