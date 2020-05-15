Most developers will be interested in inspecting application logs, mostly to understand the execution of events when thing go awry.

[Factor 11, Logs, of _The Twelve-Factor App_](https://12factor.net/logs) states all logs should be treated as event streams. The last thing you want when managing multiple, distributed applications is trying to find where each application has routed and stored its logs. If you implement custom and variant locations with inconsistent rules for persistence and rotation, then your application will get in the way when engineers try to diagnose problems on a distributed cluster. Your apps should never be concerned about the management of logs, instead the apps should simply output to a common stream. The standard streams for apps in containers are _stdout_ and _stderr_.

Your deployment of random-logger simply streams logs to stdout with a shell script [echo statement](https://github.com/chentex/random-logger/blob/master/entrypoint.sh). See logs from a Pod in the deployment.

`kubectl logs deployment/random-logger`{{execute}}

It's hard to tell from this output, but you are only seeing the log from one of the Pods in the scale group of three. When logs are requested by `deployment/<name>` the API randomly chooses only one from the replicated Pods, not all of them.

You can also get the logs from a specific Pod. Get the name of the first Pod.

`POD_0=$(kubectl get pods -o=jsonpath="{.items[0]['metadata.name']}") && echo "Pod name is: $POD_0"`{{execute}}

View the logs from that specific Pod by its name.

`kubectl logs $POD_0`{{execute}}

To get the logs of all the Pods, use the label selector (--selector or -l).

`kubectl logs --selector app=random-logger`{{execute}}

But wait, that list is pretty short.

`kubectl logs --selector app=random-logger | wc -l`{{execute}}


`kubectl logs --selector app=random-logger --tail=50 && kubectl logs --selector app=random-logger --tail=50 | echo "Total lines $(wc -l)"`{{execute}}


It's only 30 lines. When the selector is used, the log command only returns the last 10 lines from each Pod (3 pods x 10 tailed line = 30 lines). Since this is a large aggregator, it's wise to put a cap on it.

You can also see the 50 lines of a single Pod.

## Continuous Stream to Stdout

`kubectl logs -f my-pod`{{execute}}

When all Deployments report _Available_ and the Pods report _Running_ use this ```clear```{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

TODO - Verify But `-f`, a well as `--tail`, cannot be used when the `--selector | -l` flag is used.

## Selecting a Container

kubectl logs -f my-pod -c my-container              # stream pod container logs (stdout, multi-container case)
kubectl logs -f -l name=myLabel --all-containers 

## Viewing Logs from Dead Pods

The following command will create and immediately end with the Pod with status of _Completed_.

`kubectl run busybox-test-pod-status --image=busybox --restart=Never -- /bin/true`{{execute}}

`kubectl get pods`{{execute}}

`kubectl logs busybox-test-pod-status`{{execute}}

However, using the `previous=true` flag will reveal the old output.

`kubectl logs busybox-test-pod-status --previous=true`{{execute}}

