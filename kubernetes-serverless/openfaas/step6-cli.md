# CLI Commands #

## Deploy Stack of Available Functions ##

`faas-cli deploy -f https://raw.githubusercontent.com/openfaas/faas/master/stack.yml`{{execute}}

## List Functions ##

`faas-cli list`{{execute}}

`faas-cli list --verbose`{{execute}}

## Invoke Function ##

`faas-cli invoke markdown`{{execute}}

`echo Hi | faas-cli invoke markdown`{{execute}}

`uname -a | faas-cli invoke markdown`{{execute}}

