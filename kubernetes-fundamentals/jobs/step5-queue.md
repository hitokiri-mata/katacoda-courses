# Work Queue #

## Start Queuing Service ##

Start the work queue.

`kubectl apply -f https://raw.githubusercontent.com/kubernetes-up-and-running/examples/master/10-4-rs-queue.yaml`{{execute}}

Expose queue with a service to make is easy for producers and consumers to access the queue via DNS.

`kubectl apply -f https://raw.githubusercontent.com/kubernetes-up-and-running/examples/master/10-5-service-queue.yaml`{{execute T1}}

`kubectl patch service queue --type='json' --patch='[{"op": "replace", "path": "/spec/type","value":"NodePort"}]'`{{execute}}

`kubectl patch service queue --type='json' --patch='[{"op": "replace",  "path": "/spec/ports/0/nodePort", "value":31001}]'`{{execute}}

## Submit Items to Queue ##

Produce a collection of work items and place onto queue.

`QUEUE_POD=$(kubectl get pods -l app=work-queue,component=queue -o jsonpath='{.items[0].metadata.name}')`{{execute}}

`kubectl port-forward $QUEUE_POD 8080:8080 &`{{execute}}

`curl https://raw.githubusercontent.com/kubernetes-up-and-running/examples/master/10-6-load-queue.sh | bash`{{execute}}

See the _enqueued_ items count, it will be 100.

`curl $(minikube service queue --url)/memq/server/stats`{{execute}}

You can also see the queue in the portal. Because of Katacoda's virtualization you cannot address this URL from your browser, but you can use Katacoda's domain as the URL to the same service. Notice the same port number placed in the subdomain of the URL.

`https://[[HOST_SUBDOMAIN]]-31001-[[KATACODA_HOST]].environments.katacoda.com/`{{execute}}

## Process Work Items ##

Create the consumers Job.

`kubectl apply -f https://raw.githubusercontent.com/kubernetes-up-and-running/examples/master/10-7-job-consumers.yaml`{{execute}}

Watch activity of pods, queue and kubernetes dashboard

'kubectl get pods -w'{{execute}}

Go back to the Queue portal watch the items get processed until all 100 are complete.

`curl $(minikube service queue --url)/memq/server/stats`{{execute}}


## Clean Up ##

`kubectl delete rs,svc,job --selector chapter=jobs`{{execute interrupt}}