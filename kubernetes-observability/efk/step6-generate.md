Run this container to start generating random log events.

`kubectl run random-logger --image=chentex/random-logger`{{execute}}

> Thank you to Vicente Zepeda for providing this [beautifully simple container](https://github.com/chentex/random-logger).

The log events will look something like this.

```bash
...
INFO takes the value and converts it to string.
DEBUG first loop completed.
ERROR something happened in this execution.
WARN variable not in use.
...
```

Inspect the actual log events now being generated with this log command.

`kubectl logs pod/random-logger`{{execute}}

Don't be alarmed by the messages, these are just samples.
