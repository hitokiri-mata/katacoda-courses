# Parallelism #

A huge advantage of running application on Kubernetes is there are typically large amounts of resources to utilize. So far these jobs have been working serially and underutilizing the resources. Often real jobs may be longer running and incur notable CPU and memory consumption. One of the best ways to approach performance is running the jobs in parallel. Instead of each job creating a series of keys serially, have multiple jobs work on smaller units of work.

## A Race ##

Let's have a race to validate this claim, even on a single node cluster like Minikube in this Katacoda instance.

### Serially ###

First, run the job we ran in the previous step 2 and have it generate 10 keys.

`kubectl apply -f https://raw.githubusercontent.com/kubernetes-up-and-running/examples/master/10-1-job-oneshot.yaml`{{execute}}

This time we will watch for is the Duration result. Inspect the job description and extract the `Duration:` time, this will take a few minutes. If the number does not appear, this means the job is still running.

`kubectl describe jobs oneshot | grep -o 'Duration: .*' | cut -f2- -d:`{{execute}}

Once the number appears, take note of it.

`export SERIAL_DURATION=$(kubectl describe jobs oneshot | grep -o 'Created pod: .*' | cut -f2- -d:)`{{execute}}

### Parallel ###

Here is a descriptor that will run the job in parallel. Inspect the definition

`curl https://raw.githubusercontent.com/kubernetes-up-and-running/examples/master/10-3-job-parallel.yaml`{{execute}}

Notice now in the `spec:` the two settings have been applied to ensure the parallelism features is enabled `parallelism: 5` and `completions: 10`.

The template runs 10 jobs where each job generates 10 keys. For a better race comparison we want 10 jobs that each generate a single key, so the template will be slightly modified using _sed_ to change the `keygen-num-to-gen` value from 10 to 1.

`curl -s https://raw.githubusercontent.com/kubernetes-up-and-running/examples/master/10-3-job-parallel.yaml | sed '/num-to-gen=/s/=.*/=1"/' > job-parallel.yaml`{{execute}}

Run the job in parallel.

`kubectl apply -f job-parallel.yaml`{{execute}}

Again, watch for the Duration result. Inspect the parallel job description and extract the `Duration:` time, this will take a few minutes. If the number does not appear, this means the job is still running.

`kubectl describe jobs parallel | grep -o 'Duration: .*' | cut -f2- -d:`{{execute}}

Once the number appears, take note of it.

`export PARALLEL_DURATION=$(kubectl describe jobs parallel | grep -o 'Duration: .*' | cut -f2- -d:)`{{execute}}

## Race Results ##

`clear && echo -e "For over a decade prophets have voiced the contention that the organization of a single computer has reached its limits and that truly significant advances can be made only by interconnection of a multiplicity of computers. - Gene Amdahl in 1967.\n\nThe results are in:\nSerial: $SERIAL_DURATION\nParallel: $PARALLEL_DURATION"`{{execute}}

Finally, delete the 2 jobs by filtering on a label.

`kubectl delete jobs --selector chapter=jobs`{{execute}}

However, to fully take advantage of parallelism some asynchronous message queuing should also be woven into the mix. Next step is to leverage a queue.
