# Conclusion #

Once an application is in a container, it's fairly simple to ask Kubernetes to serve up the container in multiple Pods fronted with a load balancing Service. Thereafter, Kubernetes dutifully respects your declared request by ensuring the application remains running on the cluster.

There are many other types of resources that can be added to Kubernetes besides just Pods, Services and Deployments, however these are the most common resources. Later, explore the Helm scenarios to see how whole _charts_ of more complex deployments can be installed.

## Lessons Learned ##

- **Deploying** an application
- **Scaling** an application
- Load balancing and application with a **Service** for multiple **Pods** of the app
- **Resilience** maintains the declared state even with failures
- **Rolling out** new versions of an application

------
<img align="left" src="/javajon/courses/kubernetes-fundamentals/first-app/assets/nfjs.png">

For a deeper understanding of these topics and more join me, [Jonathan Johnson](https://www.linkedin.com/in/javajon/), for a transcendent experience on the [No Fluff Just Stuff Software Symposium Tour](https://nofluffjuststuff.com/home/main).