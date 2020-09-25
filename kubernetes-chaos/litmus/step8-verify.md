The experiment results are accumulated in the ChaosResult object associated with the experiment. You can inspect the results:

`kubectl describe chaosresult nginx-chaos-pod-delete`{{execute}}

The `status.verdict` is set to `Awaited` when the experiment is in progress, eventually changing to either `Pass` or `Fail`. Notice the few other details in the report.

> If you receive an `Error from server (NotFound): chaosresults.litmuschaos.io "nginx-chaos-pod-delete" not found` response from the server, wait a few minutes and try again as it may some time for the Chaos Engine to execute the experiment.

As you can see, chaos experiments be running in minutes. If you want to target Litmus to experiment on a different resources or namespaces, check out the [official documentation](https://docs.litmuschaos.io/docs/getstarted/).
