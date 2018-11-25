# Job from Resource #

It's generally preferable to define resources such as Jobs in resource manifests such as this YAML file.  

`curl https://raw.githubusercontent.com/kubernetes-up-and-running/examples/master/10-1-job-oneshot.yaml`{{execute}}

To invoke the same Job use the _apply_ command.

`kubectl apply -f https://raw.githubusercontent.com/kubernetes-up-and-running/examples/master/10-1-job-oneshot.yaml`{{execute}}

The job can be inspected with the _describe_ command.

`kubectl describe jobs oneshot`{{execute}}

When Pods run the output from the containers are captured in the Pod's /var/logs directory. If you know the name of the specific job instance, the _logs_ command can extract that log. With a little help from _grep and cut_ the name of the job is extracted and passed to the _logs_ command.

`export JOB_ID=$(kubectl describe jobs oneshot | grep -o 'Created pod: .*' | cut -f2- -d:)`{{execute}}

`echo $JOB_ID`{{execute}}

`kubectl get logs $(JOB_ID)`{{execute}}

Next, explore what happens when a Job fails.