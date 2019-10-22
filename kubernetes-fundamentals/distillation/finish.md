# Conclusion #

You now understand a few different techniques for efficiently getting your Java application into a container.  Now it's ready to be run on Kubernetes. There are some basic ways to containerize applications which are not very efficient. With binary, native applications using Graal project such as Quarkus you now have to fairly advanced ways of creating efficient containers. Java continues toward cloud native.

## Lessons Learned ##

With these steps you have learned:

- how to use the basics of the kubectl CLI tool,
- how to install Nginx on Kubernetes,
- how containers are deployed as Deployments in Pods,
- how a Service can provide access to a replication of Pods.

## References ##

- [Gradle](https://gradle.org)
- [JLink](https://docs.oracle.com/javase/9/tools/jlink.htm)
- [GraalVM](https://www.graalvm.org/)
- [Quarkus](https://quarkus.io/)
- [Multi-stage Dockerfile](https://docs.docker.com/develop/develop-images/multistage-build/)
- [(WORA)](https://en.wikipedia.org/wiki/Write_once,_run_anywhere)
- [(PORA)](https://www.theserverside.com/feature/How-the-Docker-Engine-simplifies-DevOps-from-staging-to-deployment)
- [Alpine](https://en.wikipedia.org/wiki/Alpine_Linux)
- [Alpine virtues: small, simple and secure](https://alpinelinux.org/about/)
- [ListDir source](https://github.com/javajon/listdir)
- `ListDir` example code was inspired from the related article [GraalVM: Native Images in Containers](https://blogs.oracle.com/javamagazine/graalvm-native-images-in-containers) by [Oleg Šelajev](https://github.com/shelajev).

------
![No Fluff Just Stuff](/javajon/courses/kubernetes-applications/nginx/assets/nfjs.png "No Fluff Just Stuff")

For a deeper understanding of these topics and more join me, [Jonathan Johnson](https://nofluffjuststuff.com/conference/speaker/jonathan_johnson), for a transcendent experience on the [No Fluff Just Stuff Software Symposium Tour](https://nofluffjuststuff.com).
