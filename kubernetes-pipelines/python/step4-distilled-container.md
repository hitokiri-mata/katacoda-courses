ccat `Dockerfile-bloated`{{execute}}

Using this definition, build the container image.

`docker build -t scenario/mountains-alpine:0.0.1 -f Dockerfile-alpine .`

When it's done building the container image, run the application.

`docker run -d -p 8092:8080 scenario/mountains-alpine:0.0.1`{{execute}}

The microservice is now running at port 8090.

`curl localhost:8092 | jq`{{execute}}

Inspect the size of the container image.

`docker images --filter 'scenario=python-pipelining'`{{execute}}

Notice the image size is ~[todo[]MB. This is a very small Python application and producing a container this large is excessive.
