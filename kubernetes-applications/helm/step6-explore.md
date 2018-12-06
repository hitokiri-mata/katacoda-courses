Out of the box, Helm has a fixed list of known repositories that host the most common charts you may add to Kubernetes. See the current list of public repos.

`helm repos list`{{execute}}

Within these repos are stable and incubating charts. The current count as of this writing were 243 and 84. They are consistently increasing with the maturing Kubernetes ecosystem.

`echo "The number of common charts is, stable: $(helm search stable | wc -l), incubator: $(helm search incubator | wc -l)."`{{execute}}

There are a bunch of common charts that, as a Kubernetes developer, you may want to leverage.

`helm search postgres`{{execute}}
`helm search sonarqube`{{execute}}
`helm search rabbitmq`{{execute}}
`helm search kafka`{{execute}}
`helm search prometheus-operator`{{execute}}
`helm search tensorflow`{{execute}}
`helm search stable/redis`{{execute}}

The list is long.

`helm search stable | sed -E "s/(.{27}).*$/\1/"`{{execute}}

`helm search incubator | sed -E "s/(.{27}).*$/\1/"`{{execute}}

Each chart is backed with a github repo, a readme and a team of people that are subject matter experience in forming these opinionated charts. As an example take a look as the [Minio chart source](https://github.com/helm/charts/tree/master/stable/minio) and scan the README to learn how this chart can be installed and configured.
