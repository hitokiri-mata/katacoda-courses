Create a namespace, for example, to specify a country.

`kubectl create namespace sweden`{{execute}}

In you current directory there is a YAML file for a thermometer for Solkholm Sweden.

`cat stokholm-thermometer.yaml`{{execute}}

Notice the YAML has the name and namespace (as the location) and units defined. Apply this declaration.

`kubectl apply -f stockholm-thermometer.yaml`{{execute}}

Get the resource information.

`kubectl get trm -A`{{execute}}

This is as expected by our previous example. Wouldn't it be nice if the displayed output included more information regarding the resource details?

Before continuing let's erase the blackboard. Remove the resources.

`kubectl delete trm -n default --all`{{execute}}

Remove the definition.

`kubectl delete crd therms`{{execute}}

Clean slate.

`kubectl get terms -A && kubectl get crds`{{execute}}
