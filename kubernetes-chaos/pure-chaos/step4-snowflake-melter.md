The most common chaos for Kubernetes is to periodically and randomly terminate Pods.

To define the terminator, all we need is a container that has some logic in it to find the application Pods you just started and terminate them. The Kubernetes API offers all the control we need to find and remove Pods.

## Client Library with Python

<img align="right" src="./assets/damiano-baschiera-f1LoTHjRSxo-unsplash.jpg" width=250>
There are [several languages](https://kubernetes.io/docs/reference/using-api/client-libraries/) you could use to code this logic. For this scenario, we'll choose Python as we can import a helpful Kubernetes API and the script can be loaded into a Python container. Let's look at the core of this onion:

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

Run your newly create application as a [Kubernetes CronJob](https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/):

`kubectl create cronjob snowflake-melter --image=$IMAGE --schedule='*/1 * * * *'`{{execute}}

The chaos CronJob is will now be running once a minute. More flexible chaos systems would randomize this period. See the CronJob:

`kubectl get cronjobs`{{execute}}

At the beginning of the next minute on the clock, the CronJob will create a new Pod. Watch for the Pod to spin up:

`kubectl get pods`{{execute}}

Every minute a new Pod will create and run the chaos logic. Kubernetes automatically purges the older Job Pods. Getting the logs from all the Jobs is a bit tricky, but there is a common client tool called [Stern](https://github.com/wercker/stern) that collates and displays logs from related Pods.

`stern snowflake-melter --container-state terminated --since 2m --timestamps`{{execute}}

You will discover in the logs that the code is reporting that it's not finding Pods that are eligible for deleting.

`No eligible Pods found with annotation chaos=yes.`

Use this `clear`{{execute interrupt}} to break out of the Stern tailer or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

In the next step, define a target for the snowflake melter.
