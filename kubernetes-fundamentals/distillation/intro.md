# Distilled JRE Apps in Containers #

TODO - image of Java in a container (from slides)
<img align="right" src="/javajon/courses/kubernetes-fundamentals/distillation/assets/logo_oci.png" width="400">
<img align="right" src="/javajon/courses/kubernetes-fundamentals/distillation/assets/java-logo.png" width="400">

## Distillation Pattern ##

Explain: immutable, low attack vector, small image, less memory, fast startup time, definitive CPU and memory resources, idempotent


You will learn how:

## Part I ##
- Setup K8s
- Setup registry
- Java app, gradle, run executable (* record)
- Simple dockerfile build,tag,run with Alpine (*record)
- Introduce multi-stage build
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


> [Nginx](https://www.nginx.com) is a web server which can also be used as a reverse proxy, load balancer, mail proxy and HTTP cache. The software was created by Igor Sysoev and first publicly released in 2004. A company of the same name was founded in 2011 to provide support and Nginx plus paid software.

> Nginx is free and open-source software, released under the terms of a BSD-like license. A large fraction of web servers use NGINX, often as a load balancer. [-- Wikipedia](https://en.wikipedia.org/wiki/Nginx)