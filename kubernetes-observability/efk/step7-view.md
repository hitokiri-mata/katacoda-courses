Katacoda has exposed the NodePort 31000 to access Kibana from your browser.

[Access Kibana](https://[[HOST_SUBDOMAIN]]-31000-[[KATACODA_HOST]].environments.katacoda.com/). There is also a tab above the command-line area labeled `Kibana` that takes you to the same Kibana portal.

## Security ##

> **_Tip:_** There are no credentials to access this EFK stack through Kibana. For real deployments, you would _never_ expose this type of information without at least an authentication wall. Logs typically reveal lots of dirty laundry and attack vector opportunities.

## Kibana Portal ##

New information and logs are currently streaming into Elasticsearch from various components. You can use the Portal to create filters to find only the logs emanating from the _random-logger_.

To see the logs collected from the _random-logger_ follow these steps in the Kibana portal.

1. When Kibana appears for the first time there will be a brief animation while it initializes.
1. On the Welcome page click **_Explore on my own_**.
1. From the left-hand drop-down menu (≡) select the **_Discover_** item.
1. Click on the button **_Create index pattern_** on the top.
1. In the form field _Index pattern_ enter `logstash-*`{{copy}}
1. It should read "Success!" and Click the **_> Next step_** button on the right.
1. In the next form, from the dropdown labeled _Time Filter field name_, select **_@timestamp_**.
1. From the bottom-right of the form select **_Create index pattern_**.
1. In a moment a list of fields will appear.
1. Again, from the left-hand drop-down menu (≡) select the **_Discover_** item.
1. On the right is a listing of all the log events. On the left, is a list of available fields to choose for filtering.
1. Filter the log list by first choosing the _kubernetes.pod_name_ field. When you hover over or click on the word _kubernetes.pod_name_, click the **_Add_** button to the right of the label.
1. The filter selection is added to the _Selected fields_ list. Click on the filter and select the magnifying glass (🔍) with the plus sign (+) next to _random-logger_.
1. Now only then events from the _random-logger_ appear.
1. From the available field list, select and add the _log_ field.

The log list now is filtered to show log events from the _random-logger_ service. You can expand each event to reveal further details.

From here you can start to appreciate the amount of information this stack provides. More information is in the [Kibana documentation](https://www.elastic.co/guide/en/kibana/current/getting-started.html).
