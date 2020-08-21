<img align="right" src="./assets/ivan-vranic-j9-2LIZ2_Rc-unsplash.jpg" width=400>

> Chaos Engineering is the discipline of experimenting on a system in order to build confidence in the system’s capability to withstand turbulent conditions in production. -- [Principles of Chaos Engineering](https://principlesofchaos.org/)

There are several frameworks that you can add to Kubernetes to provide chaos testing. However, creating a simple chaos tester does not mean it has to be complicated. With just a few tricks a simple chaos tester can run amuck in your cluster. Relentlessly messing with your precious snowflakes.

You will learn how to:

- Use the Kubernetes API with Python.
- Install a container with a simple script that accesses the Kubernetes API.
- Invoke a Cron Job with the Chaos script to randomly melt away Pods.
- Use annotations to define chaos targets.
