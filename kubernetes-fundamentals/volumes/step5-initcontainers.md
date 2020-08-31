InitContainers is an important pattern applied during the startup phase of a Pod. Before the Pod is consider _Running_ a series of containers that fulfill the initialization of the Pod are given a phase to run. Most initContainers depend heavily on emptyDir to ensure the primary application container has all the needed files artifacts initialized before the whole Pod is considered _Running_.

To make this point clear, but to keep it simple consider a small web server serving content. The content is stored and frequently updated in version control. When the web server starts it needs access to the latest web content updates. Using Nginx as a generic and primary application that serves up the web site, it will rely on an initContainer to initialize the latest web content.

`ccat website-from-git-clone.yaml`{{execute}}

In this example the initContainer clones a GitHub repo and injects the contents into emptyDir, once complete the Nginx web server reads the same emptyDir expecting that the initContainer dutifully completed the initialization of these website artifacts.

`kubectl apply -f website-from-git-clone.yaml`{{execute}}

With the demo-web Pod servicing with Nginx, access it with a port-forward:

`kubectl port-forward demo-web 8888:80  > /dev/null &`{{execute}}

Dump the default index page:

`lynx http://localhost:8000 --dump`{{execute}}

Here we have a website which is sourced from a git repo and transported via emptyDir over to the opinionated nginx directory from where it service content. The initContainer pattern combined with emptyDir is a strong tool for you.
