# Python Function #

To deploy a function, the Kubeless CLI tool needs some information:

- The name you will use to access the function over the Web
- The [runtime](https://kubeless.io/docs/runtimes/) to be executed to run the code (here, Python)
- The name of the file containing the function code
- The name of the function inside the file

`kubeless function deploy fibonacci --runtime python3.6 --from-file fibonacci.py --handler fibonacci.values`{{execute}}

With the above, here is a breakdown of this registration instruction:

- kubeless function deploy _fibonacci_ tells Kubeless to register a new function named fibonacci. The function will be accessible over the Web using this name. Note that this doesn’t need to be the same as the function name used inside the code (we’ll specify that a little further along using the --handler option).

- --runtime python3.6 tells Kubeless to use Python 3.6 to execute the code. OTher runtimes are availabe such as: NodeJS, Ruby, PHP, Golang, .NET and Ballerina. You can also supply a [custom runtime](https://kubeless.io/docs/runtimes/) as a container.

- --handler fibonacci.values tells Kubeless the name of the function to call inside the code module. You can see in the Python code above that the function is called values().

- --from-file /tmp/fibonacci.py tells Kubeless to upload and use the /tmp/fibonacci.py file as the source for the function. It is possible to pass a function in other ways.

You can list the new function with the kubeless CLI:

`kubeless function list`{{execute}}

While the function is deploying inspect the actual Python function source code:

`cat fibonacci.py`{{execute}}

With the deploy command, Kubeless automatically created a Kubernetes deployment and service for your function. Observe that a Deployment< Pod> containing your function is running and exposed as a service in the defaukt namespace:

`kubectl get deployments,pods,services`{{execute}}
