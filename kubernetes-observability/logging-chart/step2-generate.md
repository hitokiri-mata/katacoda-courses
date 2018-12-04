Run this _random-logger_ container to start generating continuously random logging events.

`kubectl run random-logger --image=chentex/random-logger --namespace=logging`{{execute}}

Thank you to _Vicente Zepeda_ for providing this beautifully simple container. The [source code is here](https://github.com/chentex/random-logger).
