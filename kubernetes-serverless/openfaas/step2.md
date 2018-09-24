# Deploy a Function #

Verify if you can call existing functions

`echo "# Test *Drive*"| faas-cli invoke func_markdown

`kubectl -n openfaas-fn apply -f nodeinfo.yaml`{{execute}}
