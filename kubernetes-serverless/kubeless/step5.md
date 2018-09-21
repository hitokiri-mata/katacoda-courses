# Inspect and Debug Function #

Get a description of the deployed function

`kubeless function describe fibonacci`{{execute}}

Inspect the execution logs of the function

`kubeless function logs fibonacci`{{execute}}

Call the function with a bad input

`kubeless function call fibonacci --data '{"length":"-1"}'`{{execute}}

and reinspect the logs

`kubeless function logs fibonacci`{{execute}}
