## Install Drone Command Line Tool, CLI ##

In a recent version of the Drone CLI tool.

`curl -L https://github.com/drone/drone-cli/releases/download/v1.0.7/drone_linux_amd64.tar.gz | tar zx
sudo install -t /usr/local/bin drone`{{execute}}

Verify the Drone CLI is installed and ready.

`drone --version`{{execute}}

## A Simple Pipeline of Steps ##

Inspect the following `drone.yaml` file that describes a simple pipeline.

`cat sample-drone-pipeline.yaml`{{execute}}

Now run the pipeline locally.

`drone exec sample-drone-pipeline.yaml`{{execute}}
