InitContainers is an important pattern applied during the startup phase of a Pod. Before the Pod is consider _Running_ a series of containers that fulfill the initialization of the Pod are given a phase to run. These containers are optional, Most initbut helpful when utilized. InitContainers depend heavily on emptyDir to ensure the primary application container has all the necessary files artifacts before the whole Pod is considered _Running_.

To make this point clear, but to keep it simple consider a small web server serving content. The content is stored and frequently updated in version control. When the web server starts it needs access to the latest web content updates. Using NGINX as a generic and primary application that serves up the web site, it will rely on an initContainer to initialize the latest web content.

`ccat website-from-git-clone.yaml`{{execute}}

In this example the initContainer clones a GitHub repo and injects the contents into emptyDir, once complete the NGINX web server reads the same emptyDir expecting that the initContainer dutifully completed the initialization of these website artifacts.

`kubectl apply -f website-from-git-clone.yaml`{{execute}}

With the demo-web Pod servicing with NGINX, access it with a NodePort:

`kubectl expose pod demo-web --type NodePort --port 80`{{execute}}

Patch the port to a non-random nodePort.

`kubectl patch service demo-web --type='json' --patch='[{"op": "replace", "path": "/spec/ports/0/nodePort", "value":30080}]'`{{execute}}

<img align="right" src="./assets/demo-web.png" width="200">The web interface for demo-web can be seen from the tab "Demo-web" above the command-line area or this link: https://[[HOST_SUBDOMAIN]]-30080-[[KATACODA_HOST]].environments.katacoda.com/

Here we have a website that is sourced from a git repo and transported via emptyDir over to the opinionated NGINX directory from where it serves the content. The initContainer pattern combined with emptyDir is a strong tool for you.
