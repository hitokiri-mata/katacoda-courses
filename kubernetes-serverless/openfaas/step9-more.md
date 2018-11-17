# Add Stack of Functions #

Deploy a whole set of functions. Take a look at this YAML file and see of the functions is provides.

`curl -L https://raw.githubusercontent.com/openfaas/faas/master/sample-functions/stack.yml -o stack.yaml`{{execute}}

 OpenFaaS CLI accepts this manifest to allow you to add multiple functions with this command

 `faas-cli deploy -f stack.yaml --gateway=https://[[HOST_SUBDOMAIN]]-31112-[[KATACODA_HOST]].environments.katacoda.com/`{{execute}}

 Explore the functions in the _OpenFaaS Portal_.