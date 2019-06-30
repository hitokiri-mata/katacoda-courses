# Conclusion #

Once an application is in a container, it's fairly simple to ask Kubernetes to serve up the container in multiple Pods fronted with a load balancing Service. Thereafter, Kubernetes dutifully respects your declared request by ensuring the application remains running on the cluster.

There are many other types of resources that can be added to Kubernetes besides just Pods, Services and Deployments, however these are the most common resources. Later, explore the Helm scenarios to see how whole _charts_ of more complex deployments can be installed.

## Lessons Learned ##

With these steps you have learned:

- how to **Deploy** an application,
- how to **Scale** an application,
- how to load balance an application with a **Service** for multiple **Pods** of an application,
- how **Resilience** maintains the declared state even with failures,
- how to **Roll out** new versions of an application.

------
<img align="left" src="/javajon/courses/kubernetes-fundamentals/first-app/assets/nfjs.png">

For a deeper understanding of these topics and more join me, [Jonathan Johnson](https://nofluffjuststuff.com/conference/speaker/jonathan_johnson), for a transcendent experience on the [No Fluff Just Stuff Software Symposium Tour](https://nofluffjuststuff.com).
