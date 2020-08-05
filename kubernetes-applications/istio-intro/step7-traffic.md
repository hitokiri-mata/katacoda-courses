Now that you have Istio and a sample application running let's explore what we can do with it. One of the main features of Istio is traffic management. As a Microservice architectures grow, so too grows the need for more advanced control of service-to-service communications.

## User Based Testing / Request Routing
One aspect of traffic management is controlling traffic routing based on the HTTP request, such as user agent strings, IP address or cookies.

The example below will send all traffic for the user _jason_ to the reviews:v2, meaning they'll only see the black stars. A few descriptive lines defines this rule.

`ccat samples/bookinfo/networking/virtual-service-reviews-test-v2.yaml`{{execute}}

Similarly to deploying Kubernetes configuration, routing rules can be applied using istioctl.

`kubectl apply -f samples/bookinfo/networking/virtual-service-reviews-test-v2.yaml`{{execute}}

Visit the product page and signin as a user jason (password jason)

## Traffic Shaping for Canary Releases

The ability to split traffic for testing and rolling out changes is important. This allows for A/B variation testing or deploying canary releases.

The rule below ensures that 50% of the traffic goes to reviews:v1 (no stars), or reviews:v3 (red stars).

`ccat samples/bookinfo/networking/virtual-service-reviews-50-v3.yaml`{{execute}}

Apply this traffic splitting rule.

`kubectl apply -f samples/bookinfo/networking/virtual-service-reviews-50-v3.yaml`{{execute}}

Logout of user Jason otherwise the above configuration will take priority

The weighting is not round robin, multiple requests may go to the same service, but over multple calls the statistics eventually work out.

## New Releases

Given the above approach, if the canary release were successful then we'd want to move 100% of the traffic to reviews:v3.

`cat samples/bookinfo/networking/virtual-service-reviews-v3.yaml`{{execute}}

This can be done by updating the route with new weighting and rules.

`kubectl apply -f samples/bookinfo/networking/virtual-service-reviews-v3.yaml`{{execute}}

## List All Routes

It's possible to get a list of all the rules applied.

`istioctl get virtualservices and istioctl get virtualservices -o yaml`{{execute}}
