cd cluster

Inspect the script that will install the applications

`cat install-app.sh`{{execute}}

`./install-app.sh`{{execute}}

## H2 Database

`curl -s https://[[HOST_SUBDOMAIN]]-30100-[[KATACODA_HOST]].environments.katacoda.com`{{execute}}

Connect and explore...

## World Population Microservice

`curl -s https://[[HOST_SUBDOMAIN]]-30101-[[KATACODA_HOST]].environments.katacoda.com/ping`{{execute}}

`curl -s https://[[HOST_SUBDOMAIN]]-30101-[[KATACODA_HOST]].environments.katacoda.com/countries`{{execute}}

`curl -s https://[[HOST_SUBDOMAIN]]-30101-[[KATACODA_HOST]].environments.katacoda.com/cities`{{execute}}

## Covid-19 Daily Data

`curl -s https://[[HOST_SUBDOMAIN]]-30102-[[KATACODA_HOST]].environments.katacoda.com/ping`{{execute}}

`curl -s https://[[HOST_SUBDOMAIN]]-30102-[[KATACODA_HOST]].environments.katacoda.com/countries`{{execute}}

## Aggregator

Public API or Gateway

`curl -s https://[[HOST_SUBDOMAIN]]-30103-[[KATACODA_HOST]].environments.katacoda.com/ping`{{execute}}

`curl -s https://[[HOST_SUBDOMAIN]]-30103-[[KATACODA_HOST]].environments.katacoda.com/countries`{{execute}}
