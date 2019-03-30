# Lessons Learned #

Generally there are three ways to interact with container registeries. 

1. Public registries like DockerHub or Quay.io, 
2. Private team registeries that are within you organization, often hosted by your cloud provider 
3. Local registeries that you or your team may be using on a local or private Kubernetes cluster or namespace. 

This tutorial gives you a leg up for leveraging personal and local registeries. This is ideal when you are prototyping or rapidly developing and testing a solution locally. Knowing how to quickly setup and use a private container is another technique you can pull out of your Kubernetes toolbox. 

With these steps you have learned:

- how to install a private container on Kubernetes,
- how to install web interface to list the registry contents

## References ##

- [Registry source](https://github.com/docker/distribution)
- [Registry Helm chart](https://github.com/helm/charts/tree/master/stable/docker-registry)
- [Registry UI from Jones Magloire](https://github.com/Joxit/docker-registry-ui)
- [Distribution and Registry 2.0](https://github.com/docker/distribution)
- [Registry Proxy](https://github.com/helm/charts/tree/master/incubator/kube-registry-proxy)
- [IBM MAX Breast Cancer Mitosis Detector](https://github.com/IBM/MAX-Breast-Cancer-Mitosis-Detector)

## Homage ##

Lost friend and father, [Bill Becker](https://vimeo.com/73274666). Male Breast Cancer Awareness Week Is The Third Week of October.

------
![No Fluff Just Stuff](/javajon/courses/kubernetes-pipelines/registries/assets/nfjs.png "No Fluff Just Stuff")

For a deeper understanding of these topics and more join me, [Jonathan Johnson](https://www.linkedin.com/in/javajon/), for a transcendent experience on the [No Fluff Just Stuff Software Symposium Tour](https://nofluffjuststuff.com/home/main).