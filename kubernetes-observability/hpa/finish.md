The scenario introduced the fundamental techniques to scale up and down your Pods in a Kubernetes cluster using the Horizontal Pod AutoScalar (HPA). There are more complex rules that can be applied to the HPA triggering logic and the HPA can reference metrics from other metrics registeries such as Prometheus.

## Lessons Learned ##

With these steps you have learned how to:

- &#x2714; install the metrics-server for gathering metrics,
- &#x2714; install a pod that can be scaled,
- &#x2714; define the scaling rules and the number of pods to scale up and down,
- &#x2714; how to increase service demand to trigger scaling up,
- &#x2714; how to observe scaling up and down.

## References ##

- [Horizontal Pod Autoscaler Walkthrough](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/)
- [Horizontal Pod Scaling](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/)
- [Cluster Node Scaling](https://github.com/kubernetes/autoscaler)
- [Vertical Pod Scaling](https://github.com/kubernetes/autoscaler/tree/master/vertical-pod-autoscaler)
- [Load testing tool, Locus](https://docs.locust.io/en/stable/what-is-locust.html)
- [Locust Helm Chart](https://github.com/helm/charts/tree/master/stable/locust)

------
<img align="left" src="/javajon/courses/kubernetes-observability/basics/assets/nfjs.png">

For a deeper understanding of these topics and more join me, [Jonathan Johnson](https://nofluffjuststuff.com/conference/speaker/jonathan_johnson), for a transcendent experience on the [No Fluff Just Stuff Software Symposium Tour](https://nofluffjuststuff.com).
