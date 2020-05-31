[Alex Goodman](https://github.com/wagoodman) has created a helpful tool for exploring layers in a container image called _Dive_. You can use it interactively, or add it to your CI pipeline to break builds when it finds bloated and inefficient containers.

## Dive

A tool for exploring a container image, layer contents, and discovering ways to shrink the size of your OCI image.

<img align="right" src="https://github.com/wagoodman/dive/raw/master/.data/demo.gif" width="300">

Install the Dive tool.

`wget -q https://github.com/wagoodman/dive/releases/download/v0.9.2/dive_0.9.2_linux_amd64.deb`{{execute}}

`apt install ./dive_0.9.2_linux_amd64.deb`{{execute}}

and verified it is working.

`dive --version`{{execute}}

Dive runs in two modes with an interactive text user interface in the shell or as a command line tool tuned for integration into your continuous integration pipelines.

## Interactive

To see the tool in action let's look at the internals of the BusyBox container created during the last step using it's text user interface.

`dive busybox`{{execute}}

When the tool is running there are three panels. The top-left is the listing of container layers. Move the highlighter up and down with the arrow keys to select a layer as each layer's contents appear on the right-side panel. Press the tab key to switch between the layer view (left) and the layer's file tree (right). There are key command hints at the bottom and more [key bindings](https://github.com/wagoodman/dive#keybindings) can be found here]. Take a moment to explore the tool.

The tool also allows you to select and delete files or directories from the layers. This can help you understand how to trim your containers. Dive can be a handy tool to experiment, but you should refrain from making this part of your continuous delivery process. The real trimming should happen when you define the containers with infrastructure-as-code.

The third panel in the interactive mode provides a summary of the efficiency and suspected waste found.

To exit the interactive mode, use this ```clear```{{execute interrupt}} to break out of the watch or press <kbd>Ctrl</kbd>+<kbd>C</kbd>.

## CI/CD Pipeline Integration

This tool can also be added to your pipeline and can alert you when it encounters large or bloated containers that surpass a threshold defined by you.

Let's build two containers with Python that can illustrate a process for tuning containers.

### Bloated Container (A)

The first container will be a fat container using a Dockerfile that has several bad practices.

`cat Dockerfile-A`{{execute}}

Build the container.

`docker build -t fibonacci-A --file Dockerfile-A .`{{execute}}

And run the container.

`docker run fibonacci-A 5`{{execute}}

Let's see what the Dive tool thinks of this container. Generate the report.

`dive fibonacci-A -j dive-report-A.json`{{execute}}

View the report.

`cat dive-report-A.json | jq .`{{execute}}

There are many details, so instead pick out some key findings.

`cat dive-report-A.json | jq .`{{execute}}

### Trimmed Container B

The B Dockerfine is a typical revision of a Dockerfile for Python with several best practices applied.

`cat Dockerfile-A`{{execute}}

There are more best practices and tuning that can be done, but let's start with this. Build the container.

`docker build -t fibonacci-B --file Dockerfile-B .`{{execute}}

And run the container.

`docker run fibonacci-B 5`{{execute}}

Let's see what the Dive tool thinks of this container. Generate the report.

`dive fibonacci-B -j dive-report-B.json`{{execute}}

With both container reports generated, compare the key findings.

`cat dive-report-A.json | jq .`{{execute}}
`cat dive-report-B.json | jq .`{{execute}}

