Out of the box, Helm has a fixed list of known repositories that host the most common charts you may add to Kubernetes. See the current list of public repos.

`helm repo list`{{execute}}

Within these repos are stable and incubating charts. The current count, as of this writing (12/2019), is 284 charts.

`echo "The number of common charts is, stable: $(helm search stable | wc -l)."`{{execute}}

The stable chart count is consistently increasing with the maturing Kubernetes ecosystem. There are a bunch of common charts that, as a Kubernetes developer, you may want to leverage.

- `helm search hub postgres`{{execute}}
- `helm search hub sonarqube`{{execute}}
- `helm search hub rabbitmq`{{execute}}
- `helm search hub kafka`{{execute}}
- `helm search hub prometheus-operator`{{execute}}
- `helm search hub tensorflow`{{execute}}
- `helm search hub stable/redis`{{execute}}

The list is long.

`helm search repo stable | sed -E "s/(.{27}).*$/\1/"`{{execute}}

Each chart is backed with a [GitHub repo](https://github.com/helm/charts ), a readme and a team of people that are subject matter experts in forming these opinionated charts. As an example, take a look as the [Minio chart source](https://github.com/helm/charts/tree/master/stable/minio) and scan the README to learn how this chart can be installed and configured.

There is also the public [Helm Hub](https://hub.helm.sh/), with over 854 charts.
