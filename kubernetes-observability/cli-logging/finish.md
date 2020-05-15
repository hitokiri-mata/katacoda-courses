The scenario introduced some fundamental techniques to inspecting events and application logs on Kubernetes. Because Kubernetes is distributed, you cannot just just reference logs from a single directory. You learned about the common command-line tools to inspect the logs. Beyond this scenario, explore the Daemonset and Sidecar patterns that collect and stream logs to stream aggregators such as ElasticSearch.

## Lessons Learned ##

With these steps you have learned how to:

- &#x2714; ensure your 12-factor application generates logs to streams,
- &#x2714; inspect Kubernetes cluster events,
- &#x2714; inspect Node logs,
- &#x2714; inspect container logs across multiple Pods,
- &#x2714; use some convenient command-line tools to view log aggregations.

After this scenario, you may want to explore the _Logging with EFK_ scenario.

## References ##

- [Logging Architecture](https://kubernetes.io/docs/concepts/cluster-administration/logging/#logging-at-the-node-level)
- [kubectl Cheat Sheet](kubectl logs deployment/random-logger)

------
<p style="text-align: center; padding: 1em; margin: 3em; margin-left: 10em; margin-right: 10em; border-; 1px; border-color: olive;  border-radius: 12px; border-style:outset">
<img align="left" src="./assets/jonathan-johnson.jpg" width="100" style="border-radius: 12px">
For a deeper understanding of these topics and more join <br>[Jonathan Johnson](http://www.dijure.com)<br> at various conferences, symposiums, workshops, and meetups.
<br><br>
<b>Software Architectures ★ Speaker ★ Workshop Hosting ★ Kubernetes & Java Specialist</b>
</p>
