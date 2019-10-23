# Conclusion #

**We went from a 184MB container to a 25MB container! (87% reduction)** Both containers ran the same code, from the same source, yet we were able to distill so much unneeded software out of the container. we just looked at container size, but other topics like performance and security are also important things to consider when delivering containers.

You now understand a few different techniques for efficiently getting your Java application into a container. Now it's ready to be run on Kubernetes. There are some basic ways to containerize applications that are not very efficient. With binary, native applications using GraalVM you now have more techniques to creating distilled containers. Java continues toward cloud native.

## Lessons Learned ##

With these steps you have learned how to:

- install a container registry onto Kubernetes
- build and run a simple Java application
- build and run the same application with a container
- use multi-stage technique for building containers
- leverage Java 9+ modularity with JLink
- compile Java to a native binary and run it from a container
- start using GraalVM

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
- [Top 10 Things To Do With GraalVM](https://medium.com/graalvm/graalvm-ten-things-12d9111f307d])
- [ListDir source](https://github.com/javajon/listdir)
- `ListDir` example code was inspired from the related article [GraalVM: Native Images in Containers](https://blogs.oracle.com/javamagazine/graalvm-native-images-in-containers) by [Oleg Šelajev](https://github.com/shelajev).

------
![No Fluff Just Stuff](/javajon/courses/kubernetes-applications/nginx/assets/nfjs.png "No Fluff Just Stuff")

For a deeper understanding of these topics and more join me, [Jonathan Johnson](https://nofluffjuststuff.com/conference/speaker/jonathan_johnson), for a transcendent experience on the [No Fluff Just Stuff Software Symposium Tour](https://nofluffjuststuff.com).
