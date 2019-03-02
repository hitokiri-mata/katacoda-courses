All Kubernetes clusters has some form of a Domain Name System (DNS) handler. DNS is the heart of service discovery and like everything in Kubernetes it runs in a container and handles the lookups. There are a variety of providers for Kuberentes DNS solutions. Two popular ones are Kube-DNS and [CoreDNS](https://coredns.io/). In 2018 CoreDNS became the more dominant and preferred solutions in the community.

The version of Minukube you are using here in Katacoda currently has _Kube-DNS_ service the requests.

**Note: a recent change to Minikube dns addons mean these instructions need to change. The steps below will not work.**

__Stop and proceed to Continue below.__

----------

`minikube addons list`{{execute}}
The Kube-DNS service can be seen running here.

`kubectl get services,pods,deployments -l 'k8s-app=kube-dns' --namespace kube-system`{{execute}}

Disable the Kube-DNS service.

`minikube addons disable kube-dns`{{execute}}

Wait a few moments for the service to terminate and go back into the Busybox shell.

`kubectl run curl-test --image=radial/busyboxplus:curl -i --tty --rm`{{execute}}

In vane, try to access nginx.

`curl http://nginx`{{execute}}

Exit from the Busybox shell.

`exit`{{execute}}

The requests fails as expected without the DNS service. So, substitute in the alternate _CoreDNS_ service.

`minikube addons enable coredns`{{execute}}

In a moment, the new DNS service can be seen running.

`kubectl get services,pods,deployments -l 'k8s-app=kube-dns' --namespace kube-system`{{execute}}

New DNS functionality has been enabledNotice the service name is still kube-dns, but the running Pod name is 'coredns'. Verify the DNS is working again.

`kubectl run curl-test --image=radial/busyboxplus:curl -i --tty --rm`{{execute}}

`curl --silent http://nginx.default.svc.cluster.local:80 | grep "Thank you"`{{execute}}

There are a few other DNS providers, but the important point here is you see how you can control the administration of that provider with Kubernetes' adaptable architecture.