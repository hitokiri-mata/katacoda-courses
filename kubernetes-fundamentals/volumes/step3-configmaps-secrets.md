Let's imagine you need to write some sort of microservice that provides information about world population data. Your service would mostly reach out to one or more public databanks where it can gather the raw information as it changes every year. Before diving into microservice coding, you know that the actual API should never be coded into your application. APIs are contextual information that should be mapped into an application. We also know that during the lifespan of the service, the API details may change. We have an API to world data based on the year.

[http://api.worldbank.org/v2/country/all/indicator/SP.POP.TOTL?date=2019](http://api.worldbank.org/v2/country/all/indicator/SP.POP.TOTL?date=2019)

How would we provide the application this API URL that changes once a year? Any contextual data that changes over time can simply be provided as a file to the container. Any data you place in a ConfigMap or Secret in Kubernetes can be mounted as a file for your container. To try it, first create some data:

`kubectl create configmap population --from-literal=worldpop.api=http://api.worldbank.org/v2/country/all/indicator/SP.POP.TOTL?date=2018`{{execute}}

This places the API for obtaining world population data for 2018 into a ConfigMap under the key _worldpop.api_.

This data can be provided as a file by asking Kubernetes to mount the data as a file at a specific location:

`ccat world-pop-pod.yaml`{{execute}}

The ConfigMap called _population_ has a key in it called _worldpop.api_. The value for the key is placed in a file called _api_. The _api_ file is associated with a volume called _api-sources_. The volume is then mapped to the container path at `/etc/config/api`. Create this Pod on your cluster:

`kubectl apply -f world-pop-pod.yaml`{{execute}}

The API URL is set in the ConfigMap:

`kubectl describe ConfigMap population`{{execute}}

The same data is mounted in a file in the container.

`kubectl exec world-population -ti -- ls -la /etc/config`{{execute}}

Inspect the file in the container to ensure the correct API is present.

`kubectl exec world-population -ti -- cat /etc/config/api.txt && echo`{{execute}}

```bash
kubectl patch configmap/population \
  --type merge \
  -p \
  '{"data":{"worldpop.api":"http://api.worldbank.org/v2/country/all/indicator/SP.POP.TOTL?date=2019"}}'
 ```
 {{execute}}

Re-inspect the file in the container to ensure the API has changed to 2019. You may not see the change right away as it takes about a minute for the ConfigMap controller to update the file. Continue the inspection until you see the change:

`kubectl exec world-population -ti -- cat /etc/config/api.txt && echo`{{execute}}

This type of contextual data can be also mapped to the environment variables in the container, but these values are never updated during the life of the Pod and its containers. By mounting the ConfigMap data to a volume, this gives you the flexibility to update the context data over time. Your application in the container would just need to read the file whenever the latest data is needed.
