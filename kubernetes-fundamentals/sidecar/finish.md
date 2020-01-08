# Conclusion #

You now understand two different techniques for starting a container on Kubernetes. Nginx is a commonly used for serving up web contents and as you can see is easy to start on Kubernetes. There are thousands of other containers that can easily be started with these same basic steps.

## Lessons Learned ##

With these steps you have learned how:

- &#x2714; to use the basics of the kubectl CLI tool,
- &#x2714; to install Nginx on Kubernetes,
- &#x2714; containers are deployed as Deployments in Pods,
- &#x2714; a Service can provide access to a replication of Pods,
- &#x2714; two containers work together to provide a solution,
- &#x2714; two containers share information through a shared file mount.

## References ##

- [Shared volumes](https://kubernetes.io/docs/tasks/access-application-cluster/communicate-containers-same-pod-shared-volume/)
- [Nginx](https://www.nginx.com/)
- [Kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
- [Linux Inter-process communications](https://www.tldp.org/LDP/tlk/ipc/ipc.html)

------
![No Fluff Just Stuff](/javajon/courses/kubernetes-fundamentals/sidecar/assets/nfjs.png "No Fluff Just Stuff")

For a deeper understanding of these topics and more join me, [Jonathan Johnson](https://nofluffjuststuff.com/conference/speaker/jonathan_johnson), for a transcendent experience on the [No Fluff Just Stuff Software Symposium Tour](https://nofluffjuststuff.com).
