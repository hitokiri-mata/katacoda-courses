## Access ##

KataCoda has exposed the NodePort 31000 to access Kibana from your browser. 

[Access Kibana](https://[[HOST_SUBDOMAIN]]-31000-[[KATACODA_HOST]].environments.katacoda.com/). There is also a tab above the command line area labeled `Kibana` that takes you to the same Kibana portal.

## Security ##

> **_Tip:_** There are no credentials to access this EFK stack through Kibana. For real deployments, you would _never_ expose this type of information without at least an authentication wall. Logs typically reveal lots of dirty laundry and attack vector opportunities.

## Dashboard ##

When Kibana appears for the first time there will be a brief animation while it initializes. On the Welcome page click "Explore on my own". 

Configure the index with logstash* using @timestamp as the Time field filter.

Go to Discover and you can now add your custom filters and see the logs.
