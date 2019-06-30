# Conclusion #

Job are much like Pods, but differ since they terminate once the task is completed. The Job feature ensures the job complete successfully and can optionally rerun the tasks until a success is reported. 

Job efficiently run in parallel. Where once you may have been inclined to multi-thread the application in the container, you can instead keep the container a simple task runner and rely on Kubernetes resource management and Job parallelism to a achieve threading with a more effect pattern.

When combined with a queuing or messaging mechanism, Jobs can asynchronously process any tasks you decide to design.

To further this thinking consider investigating _serverless_ or _function_ implementations on Kubernetes. In many ways Jobs are a primitive form of what various serverless solution achieve as _functions_. Take a look at [Knative](https://github.com/knative/) based solutions to understand how you may someday want to evolve your _Jobs_ into _Functions_.

## Lessons Learned ##

With these steps you have learned:

- how Jobs are defined and work in Kubernetes,
- how Kubernetes resilience recovers failed jobs,
- how Job can serially or in parallel,
- why it's more efficient to run Jobs in parallel,
- how Jobs can process a work queue.

## References ##

- [Book: Kubernetes Up & Running](http://shop.oreilly.com/product/0636920043874.do[])
- [Jobs](
https://kubernetes.io/docs/concepts/workloads/controllers/jobs-run-to-completion/)
- [CronJobs](https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/)
- [Kubernetes Up and Running Demo (kuard) App](https://github.com/kubernetes-up-and-running/kuard)

---
<img align="left" src="/javajon/courses/kubernetes-fundamentals/first-app/assets/nfjs.png">

For a deeper understanding of these topics and more join me, [Jonathan Johnson](https://nofluffjuststuff.com/conference/speaker/jonathan_johnson), for a transcendent experience on the [No Fluff Just Stuff Software Symposium Tour](https://nofluffjuststuff.com).
