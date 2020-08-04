Apply default destination rules
Before you can use Istio to control the Bookinfo version routing, you need to define the available versions, called subsets, in destination rules.

kubectl apply -f samples/bookinfo/networking/destination-rule-all-mtls.yaml

