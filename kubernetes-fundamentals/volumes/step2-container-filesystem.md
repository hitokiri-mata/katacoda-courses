Before we get into fancy mounts and volumes, first let's recognized that within each container right next to your code is a filesystem. This filesystem is one of the things that constitutes a container. Your application artifacts exist there and any other file that you decided to have contained when you defined the container image contents. When the container image is started, your application can read and write files all within the container file system.

This single command starts a container in a Pod, list its file contents, and destroy the Pod:

`kubectl run -i --tty busybox --image=busybox --restart=Never --rm=true -- ls -la`{{execute}}

This confirms for us that within the container is a file system where your application within a container can read and write files locally and innocently.

You, as the manager of a Pod, can also copy files into and out of that container file system. Create a small Pod with the NGINX webserver.

`kubectl create deployment nginx --image=nginx`{{execute}}

Get the name of the running Pod.

`export POD=$(kubectl get pod -l app=nginx -o jsonpath="{.items[0].metadata.name}") && echo $POD`{{execute}}

The NGINX Pod is on port 80, so port forward that to 8000 so we can call the web server's main index page.

`kubectl port-forward $POD 8000:80  > /dev/null &`{{execute}}

Dump the default index page:

`lynx http://localhost:8000 --dump`{{execute}}

The index page is a html file at this location `/usr/share/nginx/html` in the container:

`kubectl exec $POD -ti -- ls -la /usr/share/nginx/html`{{execute}}

Kubectl has a copy file command to copy files in and out of containers. Copy the index.html file out of the container to this local file system where you are running the shell.

`kubectl cp $POD:usr/share/nginx/html/index.html index.html`{{execute}}

Make a career-limiting move and change the file:

`sed -i "s/Welcome to nginx/☠ You Have Been Hacked ☠/g" index.html`{{execute}}

Copy the modified welcome page back to the container:

`kubectl cp index.html $POD:usr/share/nginx/html/index.html`{{execute}}

Confirm your hackery:

`lynx http://localhost:8000 --dump`{{execute}}

Granted, this first step is pretty basic. Always keep in mind all your application is doing, no matter where the file bytes physically exist, is it reads and writes to what it sees as the local file system of the container. Independent of your code and the container, it's file system can be _mounted_ to other volumes. This mount aliasing is the key to any remote file, just never tell the container or your application.

[Factor IV](https://12factor.net/backing-services) of the Twelve-Factor App states "Treat backing services as attached resources". The description lists application services such as a message broker which should be kept independent from your application. The same is true for the vast choices where your files can be stored.
