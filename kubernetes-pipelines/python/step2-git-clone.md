The scenario will reference a small example Python microservice that has already been written and placed in a public source repository. The project also contains all the YAML files to define the pipeline and allow the pipeline to build the application in a container and run it on this Kubernetes cluster.

Clone the source for the sample Python project and inspect the code.

`git clone https://github.com/javajon/mountains-service-pi`{{execute}}

Navigate into the directory.

`cd mountains-service-pi`{{execute}}

Inspect the layout of the source files.

`tree`{{execute}}

<img align="right" src="./assets/python.png" width="150">

Here is the small application code:

`ccat app/main.py`{{execute}}

Here is the container definition for the app:

`ccat app/api/mountains.py`{{execute}}

TODO.... 

Topics:
FastAPI and uvicorn
Running the app
pipeline directory


## Run the Application

Install uvicorn?




In the next step, you will be building the containers.

Here are the standard Deployment and Service manifests that start the application on Kubernetes:

`ccat src/deploy.yaml`{{execute}}

At this point, we could build the application into a container and deploy on Kubernetes using a series of command-line tools. However, most things deployed to Kubernetes should be infrastructure-as-code, including the recipes that continuously deliver application updates as we fix and evolve our applications. This CI/CD process is often captured in source code for CI/CD pipelines. With Tekton your pipelines are declared in code.
