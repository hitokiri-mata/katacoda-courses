# First Kubernetes Application #

As a prerequisite, we assume you have an introductory working knowledge of Kubernetes covered in the _Minikube_ scenario of this course.

![Minikube](/javajon/courses/kubernetes-fundamentals/minikube/assets/minikube.png "Minikube")
![Kubernetes](/javajon/courses/kubernetes-fundamentals/minikube/assets/kubernetes.png "Kubernetes")

This scenario takes you through the basics of deploying an application on Kubernetes. The application is nothing notable, but it's simple enough to get started. In the following steps you will learn:

- to **deploy** and start the _echoserver_ application
- to **scale** the application
- **Services** load balance between multiple **Pods** of the app
- Kubernetes **resilience** maintains the declared state even with failures
- to **rollout** a new version of an application
