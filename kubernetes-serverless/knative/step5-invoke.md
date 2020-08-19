Follow these commands to call the application.

Reveal the IP of the cluster and port for the Istio gateway to Knative.

`export ADDRESS=$(kubectl get node --output 'jsonpath={.items[0].status.addresses[0].address}'):$(kubectl get svc istio-ingressgateway --namespace istio-system --output 'jsonpath={.spec.ports[?(@.port==80)].nodePort}')`{{execute}}

Reveal the DNS name of the function:

`kubectl get routes --namespace hello`{{execute}}

Capture the service URL in a variable.

`export SERVICE=$(kubectl get route helloworld --namespace hello --output jsonpath='{.status.url}' | sed 's/http\?:\/\///')`{{execute}}

Confirm the locations have been discovered.

`echo Service $SERVICE is at $ADDRESS`{{execute}}

Invoke the function.

`curl -v -H "Host: $SERVICE" http://$ADDRESS`{{execute}}

You will notice there is slight delay. This is because the application is not actually running. Knative sees the request and spins up an instance of tha echo-service to service the request.

The _echo_server_ application is helpful as it echos the HTTP header information passed to it. You can see in the response the Pod that serviced the request as well as the Istio injected tracing information.

After a 3 minutes of inactivity the echo-service Pod will scale back down to zero. Observe that soon the echo-server Pod will be terminated in a few minutes.

`watch kubectl get pods --namespace hello`{{execute}}

Once complete use this `clear`{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

Knative is handling the scaling to ensure it scales up to enough applications to handle a large amount of function requests. With dwindling activity, it will also scale the application back down and even to zero (if you want) to save on resources. The scaling criteria can be configured, however the observing and scaling is all part of the Knative _Serving__ features.

One the Pods go to zero, invoike the function to see Knative serve up new Pos to service the new activity.

`curl -v -H "Host: $SERVICE" http://$ADDRESS`{{execute}}

There will be a delay when is scales from zero since it has to wait the first first Pod to be available. For this reason, having distilled and efficient containers is important to respond to Knative requests.

`kubectl get pods --namespace hello`{{execute}}
