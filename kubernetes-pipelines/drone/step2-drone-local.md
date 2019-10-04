## Install Drone Command Line Tool, CLI ##

In a recent version of the Drone CLI tool.

`curl -L https://github.com/drone/drone-cli/releases/download/v1.2.0/drone_linux_amd64.tar.gz | tar zx
sudo install -t /usr/local/bin drone`{{execute}}

Verify the Drone CLI is installed and ready.

`drone --version`{{execute}}

## A Simple Pipeline of Steps ##

Inspect the following `hello.yaml` file that describes a simple pipeline.

`cat hello.yaml`{{execute}}

Now run the pipeline locally.

`drone exec hello.yaml`{{execute}}
