# Add a Stack of Functions #

Deploy a whole set of functions. Take a look at this YAML file and see of the functions is provides.

`curl https://raw.githubusercontent.com/openfaas/faas/master/sample-functions/stack.yml`{{execute}}

 OpenFaaS CLI accepts this manifest to allow you to add multiple functions with this command

 `faas-cli deploy -f https://raw.githubusercontent.com/openfaas/faas/master/sample-functions/stack.yml`{{execute}}

 Explore the functions in the OpenFaaS Portal. The Portal is located as a tab above the command line area or click on this link: https://[[HOST_SUBDOMAIN]]-31112-[[KATACODA_HOST]].environments.katacoda.com/  