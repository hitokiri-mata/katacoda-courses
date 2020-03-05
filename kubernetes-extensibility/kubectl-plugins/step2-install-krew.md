<img align="right" src="/javajon/courses/kubernetes-extensibility/kubectl-plugins/assets/krew.png" width="300">

Krew is a tool that makes it easy to use kubectl plugins. Krew helps you discover plugins, install and manage them on your machine. It is similar to tools like apt, dnf or brew. 

There are a [few ways to install Krew](https://krew.sigs.k8s.io/docs/user-guide/setup/install/) based on your environment, but for this Katacoda scenario we will choose the recommended commands for Bash. Install Krew as a plugin for kubectl.

```
pushd "$(mktemp -d)" &&
curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/krew.{tar.gz,yaml}" &&
tar zxvf krew.tar.gz &&
KREW=./krew-"$(uname | tr '[:upper:]' '[:lower:]')_amd64" &&
"$KREW" install --manifest=krew.yaml --archive=krew.tar.gz &&
"$KREW" update &&
popd
```{{execute}}

This will take a moment to complete. If you did this on a local machine you will want to add this to your system path.

`export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"`{{execute}}

Krew is now available so verify its version.

`kubectl krew version`{{execute}}

The installation was a big ugly, but now that you have Krew, all the other plugin installations are clean and neat. First and foremost, Krew is a collector of close to 84 plugins.

`kubectl krew search | wc -l`{{execute}}

Explore the plugin list look at the list.

`kubectl krew search`{{execute}}

There are **so many helpful plugins** in this list. The next steps will showcase just a few of them, but I would encourage you to use this scenario instance to install a try out of a few others that pique your interests.
