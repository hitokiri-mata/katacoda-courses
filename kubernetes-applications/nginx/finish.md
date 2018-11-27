# Conclusion #

You now understand two different techniques for starting a container on Kubernetes. Nginx is a commonly used for serving up web contents and as you can see is easy to start on Kubernetes. There are thousands of other containers that can easily be started with these same basic steps.

## Lessons Learned ##

With these steps you have learned:

- how to use the basics of the kubectl CLI tool,
- how to install Nginx on Kubernetes,
- how containers are deployed as Deployments in Pods,
- how a Service can provide access to a replication of Pods.

Hopefully you also understand how Kubernetes is a new type of data center _operating system_ that can run your applications - across multiple nodes on your local laptop, a rack of servers, or any cloud target. If you are considering deploying multiple containers that make up a larger solution consider layering on Helm as a package manager for these manifests.

## References ##

- [Nginx](https://www.nginx.com/)
- [Managing Resources](https://kubernetes.io/docs/concepts/cluster-administration/manage-deployment/)
- [Round robin load balancing](https://en.wikipedia.org/wiki/Round-robin_DNS)
- [Kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
- [Helm, a package manager for Kubernetes](https://helm.sh/)

------
![No Fluff Just Stuff](/javajon/courses/kubernetes-applicationss/nginx/assets/nfjs.png "No Fluff Just Stuff")

For a deeper understanding of these topics and more join me, [Jonathan Johnson](https://www.linkedin.com/in/javajon/), for a transcendent experience on the [No Fluff Just Stuff Software Symposium Tour](https://nofluffjuststuff.com/home/main).