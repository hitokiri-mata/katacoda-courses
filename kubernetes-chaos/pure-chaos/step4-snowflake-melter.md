The most common chaos for Kubernetes is to periodically and randomly terminate Pods.

To define the terminator, all we need is a container that has some logic in it to find the application Pods you just started and terminate them. We could write a container, but to keep it simple we just need a script to find an existing container that can run it. The Kubernetes API offers all the control we need to find and remove Pods.

<img align="right" src="./assets/damiano-baschiera-f1LoTHjRSxo-unsplash.jpg" width=250>
There are many languages you could use to code this logic. For this scenario, we'll choose Python as we can import a helpful Kubernetes API and the script can be loaded into a Python container. Let's look at the core of this onion:

`ccat snowflake_melter.py`{{execute}}

This script can be loaded into a container.

For brevity, there is pre-made Dockerfile defined to wrap this Python code in a container:

`ccat Dockerfile`{{execute}}

## Container for Chaos Logic

Build the container:

`export IMAGE=$REGISTRY/snowflake_melter:0.1.0`{{execute}}

`docker build -t $IMAGE .`{{execute}}

Push this container image to the private registry on Kubernetes that was installed in step 2:

`docker push $IMAGE`{{execute}}

Inspect the contents of the registry by listing the container image that was just built, tagged, and pushed:

`curl $REGISTRY/v2/_catalog | jq`{{execute}}

## Invoke Chaos

`kubectl create cronjob snowflake-melter --image=$IMAGE --schedule='*/1 * * * *'`{{execute}}

The chaos Cron Job is will now be running one a minute. More flexible chaos systems would randomize this period. See the Cron Job:

`kubectl get cronjobs`{{execute}}

In less than a minute, the Cron Job will create new Pod will appear:

`kubectl get pods`{{execute}}

This is where the chaos logic runs and each minute a new Pod will appear. Older job pods will get purged.

You can inspect the Job logs to see what they are working on.

`kubectl logs job/snowflake-melter`{{execute}}

You will discover in the Job logs that they are not finding Pods that are eligible for deleting. In the next step, define a target for the snowflake melter.
