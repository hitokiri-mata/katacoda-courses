[Alex Goodman](https://github.com/wagoodman) has created a helpful tool for exploring layers in a container image called _Dive_. You can use it interactively, or add it to your CI pipeline to break builds when it finds bloated and inefficient containers.

## Dive

A tool for exploring a container image, layer contents, and discovering ways to shrink the size of your OCI image.

<img align="right" src="https://github.com/wagoodman/dive/raw/master/.data/demo.gif" width="300">

Install the Dive tool.

`wget -q https://github.com/wagoodman/dive/releases/download/v0.9.2/dive_0.9.2_linux_amd64.deb`{{execute}}

`apt install ./dive_0.9.2_linux_amd64.deb`{{execute}}

and verified it is working.

`dive --version`{{execute}}

To see the tool in action let's look at the internals of the BusyBox container created during the last step.

`dive busybox`{{execute}}

Within the bash 