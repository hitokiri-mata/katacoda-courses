<img align="middle" src="./assets/flatiron.jpg" width="400">

You just climbed a big mountain. You tackled the concepts of building Node.js into container and connecting the two applications with gRPC. All of this running on Kubernetes. Enjoy the fresh air at the top.

You can use this scenario as a building block for your next gRPC based microservices. It may not be in Node.js, but the same concepts and gRPC API library calls can be applied in a variety of other languages. The distillation patterns we applied can also translate into other language packaging for container images.

If you are concerned about the image size, the startup time or configuring the memory and CPU then head over to the scenario _Distilled JRE Apps in Containers_.

## Lessons Learned ##

With these steps you have learned how to:

- &#x2714; Write a getting started Node.js web and server application
- &#x2714; Connect two application communicate using gRPC
- &#x2714; Compose a Node.js application into a distilled container
- &#x2714; Push a container to a private registry on Kubernetes
- &#x2714; Instruct Kubernetes to start an application
- &#x2714; Access an application service running on Kubernetes

## References ##

- [Node.js](https://nodejs.org/) is a JavaScript runtime built on Chrome's V8 JavaScript engine.
- [Express.js](https://expressjs.com/) is a fast, unopinionated, minimalist web framework for Node.js.
- [gRPC](https://grpc.io/) is a high-performance, open source universal RPC framework
- Scenario adapted from [LogRocket's article](https://blog.logrocket.com/creating-a-crud-api-with-node-express-and-grpc/)
- [Distroless containers](https://github.com/GoogleContainerTools/distroless)
- [Scatch containers](https://hub.docker.com/_/scratch)
- [Ephemeril containers](https://kubernetes.io/docs/concepts/workloads/pods/ephemeral-containers/#ephemeral-containers-api)

------
<p style="width: 100%; text-align: center; padding: 1em; margin: 3em; margin-left: 10em; margin-right: 10em; border-; 1px; border-color: olive;  border-radius: 12px; border-style:outset">
<img align="left" src="./assets/jonathan-johnson.jpg" width="100" style="border-radius: 12px">
For a deeper understanding of these topics and more join <br>[Jonathan Johnson](http://www.dijure.com)<br> at various conferences, symposiums, workshops, and meetups.
<br><br>
<b>Software Architectures ★ Speaker ★ Workshop Hosting ★ Kubernetes & Java Specialist</b>
</p>
