`ccat -l dockerfile Dockerfile-alpine`{{execute}}

Using this definition, build the container image.

`docker build -t scenario/mountains-alpine:0.0.1 -f Dockerfile-alpine .`{{execute}}

When it's done building the container image, run the application.

`docker run -d -p 8092:8080 scenario/mountains-alpine:0.0.1`{{execute}}

The microservice is now running at port 8090.

`curl localhost:8092 | jq`{{execute}}

Inspect the size of the container image.

`docker images --filter 'label=scenario=python-pipelining'`{{execute}}

Notice the image size is even smaller at ~144MB. A 39% reduction from the original bloated size.

Two other projects that could take this further are GraalVM and WebAssembly. It's early days for these ideas, but more on that may be added to this scenario at a later date.

## Running on Kubernetes

So far you can run built and run a container locally. No microservice is an island. Your modularized and distributed application can be comprized of dozen, hundreds or even thousands of containers. This is why we wanted to reduce at least the image size of this one containerized microservice. Now that you have a container, your certainly push it to a registry and have Kuberntes pull it down and run it in a Pod. In the remaining steps we will take this idea further and focus on a build pipeline that can gather the source, build the container, and deliver the updated microservice to Kubernetes.
