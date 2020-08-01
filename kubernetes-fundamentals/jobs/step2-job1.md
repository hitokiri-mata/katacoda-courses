This scenario is based on the Chapter 12, Jobs, [Kubernetes Up & Running, 2nd Edition](https://learning.oreilly.com/library/view/kubernetes-up-and/9781492046523/). The chapter starts with a simple `kubectl run` command to start a Job. However, this Katacoda scenario uses Kubernetes 1.18. Active software will naturally evolve. Kubernetes is evolving and there was a decision in 1.18 to:

> Remove all the generators from kubectl run. It will now only create pods. Additionally, deprecates all the flags that are not relevant anymore. -- [1.18 Release Notes, Deprecation](https://kubernetes.io/docs/setup/release/notes/#deprecation-4)

Before you could pass different modes for the restart switch and that would tell the generator to create a Deployment, Pod, or Job. In the spirit of [do one thing and do it well](https://en.wikipedia.org/wiki/Unix_philosophy) they reduced the run command to just start Pods.

So this will no longer start a Job, it starts a Pod. Let's do it anyways see what happens.

```bash
kubectl run -i oneshot \
  --image=gcr.io/kuar-demo/kuard-amd64:blue \
  --restart=OnFailure \
  -- \
     /kuard \
     --keygen-enable \
     --keygen-exit-on-complete \
     --keygen-num-to-gen 5```{{execute}}

Once complete you will see no Jobs where started.

`kubectl get jobs`{{execute}}

Instead, a single Pod was started and the application ran to completion performing its generation of ten keys.

`kubectl get pods`{{execute}}

Take a peek at the [Kubernetes Dashboard](https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/) (tab above the command line) and see how the Job is created as a resource. In the dashboard, explore the details and logs of the Job and Pod that just ran. To obtain the login token run `token.sh`{{execute}} and copy/paste the green token.

If this was a Job it would have completed and cleaned up after itself. Since it's just a Pod, you now have garbage to clean up.

`kubectl delete pod oneshot`{{execute}}

This step explored starting a Pod with just a command. The next step will run the same as a job, but from a resource defined in a YAML.

> [Errata](https://github.com/kubernetes-up-and-running/kuard/issues/33): The above `kubectl run` command also differs from the book as an extra parameter needs to be passed to the container. The extra parameter on the 5th line, `/kuard` was added.
