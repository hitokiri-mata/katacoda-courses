Check the Pods running in the default namespace:

`kubectl get pods`{{execute}}

Only the `nginx` Pod is running.

The ChaosEngine connects the application instance to a Chaos Experiment. Explore the ChaosEngine YAML [https://hub.litmuschaos.io/generic/pod-delete](https://hub.litmuschaos.io/generic/pod-delete).

## Run the Experiment

The experiment has been deployed and the experiment target has been established. All that is left to do is to instruct the engine to start the experiment:

`kubectl apply -f https://hub.litmuschaos.io/api/chaos/1.8.0?file=charts/generic/pod-delete/engine.yaml`{{execute}}

Start watching the Pods in the default namespace:

`watch -n 1 kubectl get pods`{{execute}}

In a moment an `nginx-chaos-runner` Pod will start. This Pod is created by the Litmus engine based on the experiment criteria. In a moment, the chaos-runner will create a new Pod called `pod-delete-<hash>`. This Pod is responsible for the actual Pod deletion. Shortly after the `pod-delete-<hash>` Pod starts, you'll notice the NGINX Pod is killed. Dutifully, of course, the Kubernetes deployment controller will restart a new NGINX Pod to maintain the Deployment contract. During the experiment, you'll be able to see the status of the Pods changing from `Running` to `ContainerCreating` to `Completed` to`Terminating` based on the chaos applied.

It's during this Pod terminating and restarting where your users will feel the disruptions. Since only one Pod is serving all the implied user traffic this is an experiment that will show you do not have enough scale instances to seamlessly handle traffic without disruption during errors or failures.

Once all are running, discontinue the watch. Use this `clear`{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.
