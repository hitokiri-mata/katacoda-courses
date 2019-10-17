In our last example we took a previously created jar and added it to a container, however we are still missing a step in achieving better idempotency. What built the jar file? We used a Gradle process that used a javac compiler on the operating system all defined in the Katacoda instance. We want our builds to be configurable and predictable as well. 

There are many many [continuous integration](link CNCF CI tabs) (CI) systems that now fully embrace using containers. CI solutions where each step in the build stages and pipelines are done inside of containers all which YOU define and control. But CI systems are whole other topic and here in this scenario we just want to concentrate on building efficient containers without pulling in other DevOps stacks.

Fortunately, the Docker tooling added the idea of [multi-stage](https://docs.docker.com/develop/develop-images/multistage-build/) building to the Dockerfile definition in version 17.05 (2017-05-04). In earlier versions of the specification the rule was only one "FROM" command shall appear as the first instruction line in a Dockerfile. However, people started needing leading "scratch" containers to be used to build, assemble and trim artifacts before they can be a payload candidate for the final container. This is where multi-stage builds come into play. An example is a scratch container than can compile our jar, then a final contain that holds the final jar artifact.

Consider this definition.

```
FROM maven:3.5-jdk-8-alpine as builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM openjdk:8-jre-alpine
COPY --from=builder /app/target/helloWorld-*.jar /helloWorld.jar
ENV PORT 3333
CMD ["java","-Dserver.port=${PORT}","-jar","/helloWorld.jar"]
```

Notice the two FROM statements. The first FROM declares a container that is big and contains a Java compiler.  This contains has all the dependencies that can compile the should code, run Gradle and produce a jar file. However this first container is much too bloated and filled in tools we would never need in production. The second FROM defined the final container and its the smaller Alpine instance that will simply hold the JRE and jar of the application. The key line is the COPY-FROM which transmits the artifact output of the first _build_ container into the last _Alpine_ container. During the container build both containers are used, however the final container image will only include the containers defined in hte _last_ FROM stage. Distillation and idempotency achieved. 

Build the ListDir application with the multi-stage build.

`docker build -t example/listdir:0.1.0`{{execute}}

After a few moments a new container is built.

`docker images`{{execute}}

Notice the size of the binary container image is about (TODO) K. This built image with a Linux OS, a JRE, and our ListDir application can be run. Let's see how long the execution will take.

`time docker run example/listdir:0.1.0`{{execute}}

run it a a few more times and see what the average time and variance is. It should take about TODO seconds +/- about 0.050 (TODO) seconds.

Compare this time to running the application natively, it's about (TODO, the same?). However, we now have much more control over the environment including the JRE version.
