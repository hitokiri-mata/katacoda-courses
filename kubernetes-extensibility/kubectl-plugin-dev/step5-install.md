Another make task will build be application as a plugin for `kubectl`.

`make cli-install`{{execute}}

The plugin binary now in the GoLang bin directory.

`ls $GOPATH/bin`{{execute}}

Because this directory is in your `$PATH`, this is not a plugin available for `kubectl`.

`kubectl example version`{{execute}}
