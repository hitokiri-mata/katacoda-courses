In the last step you saw how you can interact with the registry with REST calls. However, its always helpful to have a decent web interface in front of your registry. There are a few open solutions out there that all run as containers. 

This particular one [joxit/docker-registry-ui](https://github.com/Joxit/docker-registry-ui) is solid and provides a clean interface. Merci beaucoup, Jones Magloire.

`kubectl create -f registry-ui.yaml`{{execute}}

In moment the new web interface will be available. Open the [registry web interface](
https://[[HOST_SUBDOMAIN]]-31000-[[KATACODA_HOST]].environments.katacoda.com/) and observe it's empty.
