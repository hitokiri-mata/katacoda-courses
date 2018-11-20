# Scaling #

Copy this query and paste it in as a query string for a new graph in Prometheus.

`rate( gateway_function_invocation_total{code="200"} [20s])`{{copy}}

Navigate to Prometheus and paste in that query.

https://[[HOST_SUBDOMAIN]]-31120-[[KATACODA_HOST]].environments.katacoda.com/

Deploy the _figlet_ function.

`faas-cli store deploy figlet`{{execute}}

Exercise the _figlet_ function.

(TODO: Currently this command in this demonstration is failing.)

`while [ true ]; do curl -X POST https://[[HOST_SUBDOMAIN]]-31112-[[KATACODA_HOST]].environments.katacoda.com/function/figlet; done;`{{execute}}

This exercise is adopted from [lab 9 found here](https://github.com/openfaas/workshop/blob/master/lab9.md).