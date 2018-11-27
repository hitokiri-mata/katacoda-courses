# Conclusion #

Keeping configurations and secrets out of your codebase is an important pattern to follow for application on Kubernetes. Kubernetes can be deployed to a variety of data center targets and your application should also accommodate these different contextual settings. As you have learned, the environment configuration can all be stored in ConfigMaps and Secrets. This allows your applications to reference these configurations as environmental resources.

## Secrets and Protection ##

If you are interested in storing secrets safely in version control, consider this approach ["Sealed Secrets" for Kubernetes](https://github.com/bitnami-labs/sealed-secrets).

Since secrets are stored in etcd it's recommended to separate and firewall your etcd cluster. This is an advanced administration topic for Kubernetes, but it's important to keep your secrets _secret_. [See 11 Ways (Not) to Get Hacked](https://kubernetes.io/blog/2018/07/18/11-ways-not-to-get-hacked/#4-separate-and-firewall-your-etcd-cluster).

Lastly, enable RBAC and protect your Kubernetes API. Unprotected access to the cluster, such as through the dashboard, can unveil secrets. Invest in protecting your Kubernetes cluster and avoid what Tesla and others have done in the past [Lessons from the Cryptojacking Attack at Tesla](https://redlock.io/blog/cryptojacking-tesla).

## Lessons Learned ##

With these steps you have learned:

- how to create configuration data in the form of ConfigMaps and Secrets,
- how Pods make configuration accessible for applications in containers,
- how secrets should remain secrets.

## References ##

- [__Free PDF__ of Kubernetes Up & Running: CHAPTER 11, ConfigMaps and Secrets](https://azepdf.com/kubernetes-up-and-running-aaronmsftcom.html)
- [ConfigMap](https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/)
- [Secrets](https://kubernetes.io/docs/concepts/configuration/secret/)
- [Configuring Redis using a ConfigMap](https://kubernetes.io/docs/tutorials/configuratSecrets)
- [Wired article on security risks and Tesla case study](https://www.wired.com/story/cryptojacking-tesla-amazon-cloud/ion/configure-redis-using-configmap/)
- [Storage of secrets as plain text in etcd](https://github.com/bitnami-labs/sealed-secrets)
- [Vault](https://www.vaultproject.io/)

------
![No Fluff Just Stuff](/javajon/courses/kubernetes-applications/configmap-secrets/assets/nfjs.png "No Fluff Just Stuff")

For a deeper understanding of these topics and more join me, [Jonathan Johnson](https://www.linkedin.com/in/javajon/), for a transcendent experience on the [No Fluff Just Stuff Software Symposium Tour](https://nofluffjuststuff.com/home/main).
