Most developers will be interested in inspecting application logs, mostly to understand the execution sequences when things go awry.

[Factor 11, Logs, of _The Twelve-Factor App_](https://12factor.net/logs) states all logs should be treated as event streams. The last thing you want when managing multiple, distributed applications is trying to find where each application has routed and stored its logs. If you implement custom and variant locations with inconsistent rules for persistence and rotation, then your application will get in the way when engineers try to diagnose problems on a distributed cluster. Your apps should never be concerned about the management of logs. Instead, the apps should simply output to a common stream. The standard streams for apps in containers are _stdout_ and _stderr_.

The [documentation for `kubectl logs`](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#logs) states these options:

`$ kubectl logs [-f] [-p] (POD | TYPE/NAME) [-c CONTAINER]`

Let's explore these options and nuances.

Your deployment of random-logger simply streams logs to stdout with a shell script [echo statement](https://github.com/chentex/random-logger/blob/master/entrypoint.sh). Inspect the current logs from the container inside the Pod, as part of the deployment.

`kubectl logs deployment/random-logger`{{execute}}

It's hard to tell from this output, but you are only seeing the log from one of the Pods in the scale group of three. When logs are requested by `deployment/<name>` the API randomly chooses only one from the replicated Pods, not all of them.

You can also get the logs from a specific Pod. Get the name of the first Pod.

`POD_0=$(kubectl get pods -o=jsonpath="{.items[0]['metadata.name']}") && echo "Pod name is: $POD_0"`{{execute}}

View the logs from that specific Pod by its name.

`kubectl logs $POD_0`{{execute}}

To get the logs of all the Pods, use the label selector (--selector or -l).

`kubectl logs --selector app=random-logger`{{execute}}

But wait, that list is pretty short.

`kubectl logs --selector app=random-logger | echo "Log lines: $(wc -l)"`{{execute}}

It's only 30 lines. When the selector is used, the log command only returns the last 10 lines from each Pod (3 pods x 10 tailed line = 30 lines). Since this is a large aggregator, it's wise to put a cap on it.

You can get a longer list.

`kubectl logs --selector app=random-logger --tail=50 && kubectl logs --selector app=random-logger --tail=50 | echo "Log lines $(wc -l)"`{{execute}}

Its 150 lines, as you see the 50 lines from each of the 3 Pods.

But a `--tail=-1` for all lines will fail when there is more than one Pod.

`kubectl logs --selector app=random-logger --tail=-1"`{{execute}}

## Continuous Stream to Stdout

Sometimes you may want to observe and application by watching the accumulating log lines. Use the `follow=true | -f` switch to stream the events to stdout.

`kubectl logs -f deployment/random-logger`{{execute}}

As the application generates a new log event each second, a new log event will appear. Use this ```clear```{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

## Logs from a Specific Container

When there is one container in a Pod the log command can't assume to deliver the log from a single container. To see the log from a specific container in a Pod the `-container=<name> | -c=<name>` switch can be used.

Start a Pod with two containers.

`kubectl create -f bipedal.yaml`{{execute}}

Try the same logging request as above and notice the error.

`kubectl logs --selector app=bipedal`{{execute}}

Instead, add a specific container name of the log stream you wish to inspect.

`kubectl logs --selector app=bipedal -c=container-b`{{execute}}

## Accessing Log from the Pod's Service

You can also access the logs from the Service that fronts the Pod. Expose the bipedal Pod with a Service.

`kubectl expose deployment/bipedal --port-80`{{execute}}

Access the logs, you still have to specify the specific container when there is more than one.

`kubectl logs -f service/bipedal -c=container-a`{{execute}}

## Viewing Logs from Dead Pods

When containers crash the current logs are not available without the `--previous=true | -p` flag. Sometimes it's important to obtain the logs from crashed containers to diagnose the cause. The following command will create and immediately end with the Pod status of _Completed_.

`kubectl run busybox-test-pod-status --image=busybox --restart=Never -- /bin/true`{{execute}}

`kubectl get pods`{{execute}}

Once the Pod has reached the `Complete` status try to get the log.

`kubectl logs busybox-test-pod-status`{{execute}}

Notice the log is blank. However, using the `previous=true | -p` flag will reveal the old output.

`kubectl logs busybox-test-pod-status --previous=true`{{execute}}

This `BadRequest` message is the log from the previously terminated container.

## Conclusion

That covers `$ kubectl logs [-f] [-p] (POD | TYPE/NAME) [-c CONTAINER]`. What trips people often are these key points:

1. If there is more than one container, the specific container -c needs to be specified.
1. If aggregation is requested from multiple Pods, then tail=-1 and `follow=true | -f` switch will not work.
1. Use `previous=true | -p` switch for debugging crashed Pods.

Another point that may not be obvious is the `logs` command will collect logs from containers yet you are never concerned where those containers are running in the cluster. Kubernetes is protecting you from having to root around for log files across your datacenter.
