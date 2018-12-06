There are many other repos that you can add to Helm. If your chart is in a Github account, the location can be registered to Helm so it can pull the chart from that source.

If you search Helm for _fabric8_, it will not be listed.

`helm search fabric8`{{execute}}

This is because fabric8 maintains its own chart repository. Their repository can be added to Helm.

`helm repo add fabric8 https://fabric8.io/helm`{{execute}}

With this the repo will appear in the repo list.

`helm repo list`{{execute}}

Now, the chart can be listed.

`helm search fabric8`{{execute}}

A specific chart can be inspected.

`helm inspect fabric8/ipaas-platform`{{execute}}

What about creating your own chart? In the next step, let's create a chart.