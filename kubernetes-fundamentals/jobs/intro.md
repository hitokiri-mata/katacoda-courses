# Jobs #

As a prerequisite, we assume you have an introductory working knowledge of Minikube covered in the Minikube scenario of this course.

[Kubernetes Up & Running](/javajon/courses/kubernetes-fundamentals/jobs/assets/kubernetes-up-and-running-book.png "Kubernetes Up & Running")

<img align="right" src="/javajon/courses/kubernetes-fundamentals/jobs/assets/kubernetes-up-and-running-book.png">

This scenario takes you through the basics of [Job resources](https://kubernetes.io/docs/concepts/workloads/controllers/jobs-run-to-completion/) on Kubernetes. Chapter 10 of the 2017 [O'Reilly Kubernetes Up & Running](http://shop.oreilly.com/product/0636920043874.do[]) book from [Kelsey Hightower](https://twitter.com/kelseyhightower), [Brendan Burns](https://twitter.com/BrendanBurns), and [Joe Beda](https://blog.heptio.com/@jbeda) has a very nice explanation of Jobs. Therefore, this scenario is simply a manifestation of their explanation in Katacoda form.

You will learn:

- How Jobs are defined and work in Kubernetes
- How Kubernetes resilience recovers failed jobs
- How Job can serially or in parallel
- Why it's more efficient to run Jobs in parallel
- How Jobs can process a work queue

The Jobs feature is described in the [Kubernetes documentation](https://kubernetes.io/docs/concepts/workloads/controllers/jobs-run-to-completion/). More references to documentation is listed at the end of this scenario.