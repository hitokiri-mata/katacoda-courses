# Conclusion #

Discovering services through simple labels provided from environment settings makes calling other services easy from your application. When you decide on a Kubernetes cluster to use, one of the first things you should investigate is what service flavor provides the DNS resolutions.

The lesson does not cover more complex topics such as meshing, ingressing, egressing nor security protections. But, with these fundamentals you can now expand into those topics.

Here are some addition Katacoda courses:

- [Create Ingress Routing](https://www.katacoda.com/courses/kubernetes/create-kubernetes-ingress-routes)
- [Networking Introduction](https://www.katacoda.com/courses/kubernetes/networking-introduction)
- [Get Started with Istio and Kubernetes](https://www.katacoda.com/courses/istio/deploy-istio-on-kubernetes)

## Lessons Learned ##

With these steps you have learned:

- how your containerized application can find and call other services,
- how DNS providers can plug themselves into the cluster,
- how service discovery works in Kubernetes.

## References ##

- [Connecting Applications with Services](https://kubernetes.io/docs/concepts/services-networking/connect-applications-service/)
- [DNS for Services and Pods](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/)
- [Configuring Redis using a ConfigMap](https://kubernetes.io/docs/tutorials/configuration/configure-redis-using-configmap/)
- [Cluster DNS: CoreDNS vs Kube-DNS](https://coredns.io/2018/11/27/cluster-dns-coredns-vs-kube-dns/)
- [CoreDNS](https://coredns.io/)

------
<img align="left" src="/javajon/courses/kubernetes-fundamentals/configmap-secret/assets/nfjs.png">

For a deeper understanding of these topics and more join me, [Jonathan Johnson](https://www.linkedin.com/in/javajon/), for a transcendent experience on the [No Fluff Just Stuff Software Symposium Tour](https://nofluffjuststuff.com/home/main).
