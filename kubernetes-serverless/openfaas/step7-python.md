# First Python Function #

The previous step invoked a pre-defined function. Let's create a new function and invoke it.

New or updated OpenFaaS functions progress through distinct phases before they can run: Create, Build, Push and Deploy. The later Build, Push and Deploy often is converged into a single _up_ command.

## Create ##

Create the structure and files for the new function.

`faas-cli new fibonacci --lang python3 --prefix $REGISTRY/fibonacci --gateway $OPENFAAS_URL`{{execute}}

In the current directory there is a pre-written fibonacci Python code example. Notice at the top is the "handle" method that OpenFaaS expects as a signature for the function.

`cat fibonacci.py`{{execute}}

Copy the example Python code into the generated directory.

`cp fibonacci.py fibonacci/handler.py`{{execute}}

## Up to Build, Push and Deploy ##

With the function coded and defined deploy the artifacts to OpenFaaS and it will take care of all the server details for you, after all it's _serverless_.

`faas-cli up -f fibonacci.yml`{{execute}}

## Invoke ##

With the new function deployed OpenFaaS took care of bundling it into a container and instructing Kubernetes to create a Pod and Service so it can start handling requests.

Invoke the new function this with command.

`echo 5 | faas-cli invoke fibonacci`{{execute}}

If you wish to update the function logic you can edit and redeploy with the `--replace` switch.

`faas-cli up -f fibonacci.yml --update=false --replace`{{execute}}