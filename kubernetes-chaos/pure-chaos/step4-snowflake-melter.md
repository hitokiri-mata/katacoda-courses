The most common chaos for Kubernetes is to periodically and randomly terminating Pods.

To define the terminator, all we need is a container that has some logic in it to find the application Pods you just started and terminate them. We could write a container, but to keep it simple we just need a script to find an existing container that can run it. The Kubernetes API offers all the control we need to find and remove Pods.

There are many languages you could use to code this logic. For this scenario, we'll choose Python as we can import a helpful Kubernetes API and the script can be loaded into a Python container. Let's look at the the core of this onion:

```bash
`ccat snowflake_melter.py`{{execute}}

This script can be loaded into a container.

For brevity, there is pre-made Dockerfile defined to wrap this Python code in a container:

`ccat Dockerfile`{{execute}}

Build the container:

`export IMAGE=$REGISTRY/snowflake_melter:0.1.0`{{execute}}

`docker build -t $IMAGE .`{{execute}}

Push this container image to the private registry on Kubernetes that was installed in step 2:

`docker push $IMAGE`{{execute}}

Inspect the contents of the registry now listing the container image that was just built, tagged, and pushed:

`curl $REGISTRY/v2/_catalog | jq`{{execute}}

## Invoke Chaos

`kubectl create cronjob --schedule='*/1 * * * *' snowflake-melter --image=$TAG`{{execute}}

