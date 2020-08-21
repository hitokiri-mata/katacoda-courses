<img align="right" alt="Credit: Photo by Jilbert Ebrahimi on Unsplash" title="Credit: Photo by Jilbert Ebrahimi on Unsplash" src="./assets/ivan-vranic-j9-2LIZ2_Rc-unsplash.jpg" width=400>

> Adopting chaos engineering strategies for your production environment is useful, because it is the only way to test if a system supports unexpected destructive events. -- [KubeInvaders](https://kubernetes.io/blog/2020/01/22/kubeinvaders-gamified-chaos-engineering-tool-for-kubernetes)

There are several frameworks that you can add to Kubernetes to provide chaos testing. However, creating a simple chaos tester does not mean it has to be complicated. With just a few tricks a simple chaos tester can run amuck in your cluster. Relentlessly messing with your precious snowflakes.

You will learn how to:

- Install a container with a simple script that accesses the Kubernetes API
- Elevate the security context of a Pod to grant it access to the Kubernetes API.
- Write the application in a Cron Job so it randomly.
- Use annotations to affect behaviors.
