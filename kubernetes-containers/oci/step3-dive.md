[Alex Goodman](https://github.com/wagoodman) has created a helpful tool for exploring layers in a container image called _Dive_. You can use it interactively, or add it to your CI pipeline to break builds when it finds bloated and inefficient containers.

## Dive

A tool for exploring a container image, layer contents, and discovering ways to shrink the size of your OCI image.

Return to the default directory and install the Dive tool.

`cd ~/tutorial`{{execute}}

`wget -q https://github.com/wagoodman/dive/releases/download/v0.9.2/dive_0.9.2_linux_amd64.deb`{{execute}}

`apt install ./dive_0.9.2_linux_amd64.deb`{{execute}}

and verified it's working.

`dive --version`{{execute}}

Dive runs in two modes with an interactive text user interface (TUI) in the shell or as a command-line tool tuned for integration into your continuous integration pipelines.

## Interactive

To see the tool in action let's look at the internals of the _Redis_ container image created during the last step using Dive's text user interface.

<img align="right" src="./assets/redis.png" width="100">
`dive redis`{{execute}}

In the interactive UI there are three panels; Layers, Current Layer Contents, and Image Details. The top-left is the listing of container layers. Move the highlighter up and down with the arrow keys to select a layer. Each layer's contents appear on the right-side panel. Press the tab key to switch between the layer view (left) and the layer's file tree (right). There are key command hints at the bottom and more [key bindings](https://github.com/wagoodman/dive#keybindings) can be found here]. Take a moment to explore the tool.

The tool also allows you to select and delete files or directories from the layers. This can help you understand how to trim your containers. Dive can be a handy tool to experiment, but you should refrain from using this UI as part of your continuous delivery process. The real trimming should happen when you define the containers with infrastructure-as-code.

The third panel in the interactive mode provides a summary of the efficiency and potential waste found.

To exit the interactive mode, use this ```clear```{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

Inspect the _empty_ container image and verify it's truly empty.

`dive empty`{{execute}}

Inspect the _BusyBox_ container image.

`dive busybox`{{execute}}

Notice all the commands are present and the image efficiency is at 100%. Next, let's look at some less efficient containers.

You can explore other containers from other registries.

`dive bitnami/kafka:2.5.0`{{execute}}
