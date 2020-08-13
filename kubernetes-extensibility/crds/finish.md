CRDs are a mechanism used to add new `kind`s into a Kubernetes cluster. CRDs are all part of the extensibility of Kubernetes and its API. CRDs are in widespread use as a Kubernetes extensibility mechanism and have been available in beta since the 1.7 release. The 1.16 release marks the graduation of CRDs to general availability (GA). When added CRDs are connected to custom controllers, it leads you to the Operator pattern. You now have a solid introduction to the powerful [Operator pattern](https://kubernetes.io/docs/concepts/extend-kubernetes/operator/).

## Lessons Learned ##

With these steps you have learned:

- &#x2714; How to create a CRD and define custom attributes
- &#x2714; How how your CRD becomes a new resource
- &#x2714; How to add, inspect, and remove instances of a custom resource

## Special Thank You

To **[Ken Sipe](https://www.linkedin.com/in/kensipe/)** as he inspired this scenario from [his labs found here](https://github.com/kensipe/k8s-ext-workshop).

## References ##

- [Extend the Kubernetes API with CustomResourceDefinitions](https://kubernetes.io/docs/tasks/extend-kubernetes/custom-resources/custom-resource-definitions)
- [Additional Printer Columns](https://kubernetes.io/docs/tasks/access-kubernetes-api/custom-resources/custom-resource-definitions/#additional-printer-columns)
- [Operator Pattern](https://kubernetes.io/docs/concepts/extend-kubernetes/operator/)
- [Kubectl Cheatsheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
- [jq](https://stedolan.github.io/jq/)

------
<p style="text-align: center; padding: 1em; margin: 3em; margin-left: 10em; margin-right: 10em; border-; 1px; border-color: olive;  border-radius: 12px; border-style:outset">
<img align="left" src="./assets/jonathan-johnson.jpg" width="100" style="border-radius: 12px">
For a deeper understanding of these topics and more, join <br>[Jonathan Johnson](http://www.dijure.com)<br> at various conferences, symposiums, workshops, and meetups.
<br><br>
<b>Software Architectures ★ Speaker ★ Workshop Hosting ★ Kubernetes & Java Specialist</b>
</p>
