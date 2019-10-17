What we need is more control of the environment in which our applications will be developed, tested and deploy upon. This environmental control is called infrastructure-as-code. This is a a major contributor to widening adoption of using containers in our industry. Developers of the business solutions now have more control of the stack the applications depends on. This increased power to control idempotency mean we say less often, "Not sure what your problem is, works on my machine."

In the previous step we ran the ListDir app on some underlying operating system and Java runtime engine provided by this Katacoda instance. Let's instead define our own [idempotent](link to definition) machine stack. In the same source directory there is a packaging directory with a Dockerfile.

`cat packaging/Dockerfile`{{execute}}

Notice the Dockerfile specifies the exact version of Linux and the JRE we wish to use. Once those have been defined our application is also added into the container. Let's build a container using this definition.

`docker build -t example/listdir:0.1.0`{{execute}}

After a few moments a new container is built.

`docker images`{{execute}}

Notice the size of the binary container image is about (TODO) K. This built image with a Linux OS, a JRE, and our ListDir application can be run. Let's see how long the execution will take.

`time docker run example/listdir:0.1.0`{{execute}}

run it a a few more times and see what the average time and variance is. It should take about TODO seconds +/- about 0.050 (TODO) seconds.

Compare this time to running the application natively, it's about (TODO, the same?). However, we now have much more control over the environment including the JRE version.

We could have used a few other base Linux variants, but [Alpine](link to definition) has emerged as being one of the best base containers to use because it follows the best practices of the distillation pattern. It has a small attack surface, also called the attack vector. Once running it is immutable since it purposely omits a package manager. Your images based on Alpine tend to be small as the Alpine base image is only (TODO) mb.

But there is more with can do with the distillation pattern in relation to idempotency.
