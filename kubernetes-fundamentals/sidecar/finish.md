# Conclusion #

You now understand two different techniques for starting a container on Kubernetes. Nginx is a commonly used for serving up web contents and as you can see is easy to start on Kubernetes. There are thousands of other containers that can easily be started with these same basic steps.

## Lessons Learned ##

With these steps you have learned how:

- to use the basics of the kubectl CLI tool,
- to install Nginx on Kubernetes,
- containers are deployed as Deployments in Pods,
- a Service can provide access to a replication of Pods,
- two containers work together to provide a solution,
- two containers share information through a shared file mount.

## References ##

- [Shared volumes](https://kubernetes.io/docs/tasks/access-application-cluster/communicate-containers-same-pod-shared-volume/)
- [Nginx](https://www.nginx.com/)
- [Managing Resources](https://kubernetes.io/docs/concepts/cluster-administration/manage-deployment/)
- [Round robin load balancing](https://en.wikipedia.org/wiki/Round-robin_DNS)
- [Kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
- [Helm, a package manager for Kubernetes](https://helm.sh/)

------
![No Fluff Just Stuff](/javajon/courses/kubernetes-fundamentals/sidecar/assets/nfjs.png "No Fluff Just Stuff")

For a deeper understanding of these topics and more join me, [Jonathan Johnson](https://nofluffjuststuff.com/conference/speaker/jonathan_johnson), for a transcendent experience on the [No Fluff Just Stuff Software Symposium Tour](https://nofluffjuststuff.com).
