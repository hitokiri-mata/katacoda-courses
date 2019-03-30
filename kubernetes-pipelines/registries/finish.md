# Conclusion #

Generally there are three ways to interact with container registeries. 

1. Public registries like DockerHub or Quay.io, 
2. Private team registeries that are within you organization, often hosted by your cloud provider 
3. Local registeries that you or your team may be using on a local or private Kubernetes cluster or namespace. 

This tutorial gives to a leg up on getting started using registeries locally. This is ideal when you are prototyping or rapidly developing and testing a solution locally. Knowing how to quickly setup and use a private container is another technique you can pull out of your Kubernetes toolbox. 

## Lessons Learned ##

With these steps you have learned:

- how to install a private container on Kubernetes,
- how to install web interface to list the registry contents

## References ##

- [Registry source](https://github.com/docker/distribution)
- [Registry Helm chart](https://github.com/helm/charts/tree/master/stable/docker-registry)
- [Distribution and Registry 2.0](https://github.com/docker/distribution)
- [Registry Proxy](https://github.com/helm/charts/tree/master/incubator/kube-registry-proxy)
- [Portus](https://github.com/SUSE/Portus). An authorization server and a user interface for the Docker Registry API version 2. The minimum required version of Registry is 2.1.
- [Portus chart](https://github.com/GrantStreetGroup/portus-helm)
- [IBM MAX-Weather-Forecaster](https://github.com/IBM/MAX-Weather-Forecaster)

------
![No Fluff Just Stuff](/javajon/courses/kubernetes-pipelines/registries/assets/nfjs.png "No Fluff Just Stuff")

For a deeper understanding of these topics and more join me, [Jonathan Johnson](https://www.linkedin.com/in/javajon/), for a transcendent experience on the [No Fluff Just Stuff Software Symposium Tour](https://nofluffjuststuff.com/home/main).