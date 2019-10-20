# Distilled JRE Apps in Containers #

<img align="right" src="/javajon/courses/kubernetes-fundamentals/distillation/assets/java-distillation.png" width="500">

For years one of Java's strengths was _write once, run anywhere_ [(WORA)](https://en.wikipedia.org/wiki/Write_once,_run_anywhere). With containers it's now polyglot and _package once, run anywhere_ [(PORA)](https://www.theserverside.com/feature/How-the-Docker-Engine-simplifies-DevOps-from-staging-to-deployment). All this is about writing our code to be agnostic from the target.

Java remains relevant for containers. However, it would appear between WORA and PORA there is some redundancy. Indeed there is an it can lead to large containers for Java.

The scenario walks through various steps for distilling a container to its minimum to support your Java application.

## Distillation Pattern ##

Explain: immutable, low attack vector, small image, less memory, fast startup time, definitive CPU and memory resources, idempotent

You will learn how:

## Part I ##

- Install a container registry onto Kubernetes
- Build and run a simple Java application
- Build and run the same application with a container
- Introduce multi-stage container building
- Put into Portola (*record)
-Build with Kaniko
-JLink (*Record)

## Part II ##

- Introduce GraalVM
- Run as hotspot replacement
- Micronaut
- Quarkus
- Helidon
- Compile with Micronaut (*Record)
- Compile with Helidon (*Record)
