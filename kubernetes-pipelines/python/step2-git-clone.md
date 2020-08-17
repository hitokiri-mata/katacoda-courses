The scenario will reference a small example Python microservice that has already been written and placed in a public source repository. The project also contains all the YAML files to define the pipeline and allow the pipeline to build the application in a container and run it on this Kubernetes cluster.

The microservice leverages the [FastAPI](https://fastapi.tiangolo.com/) web framework for Python. Clone the source for the sample Python project and inspect the code.

`git clone https://github.com/javajon/mountains-service-pi`{{execute}}

Navigate into the directory.

`cd mountains-service-pi`{{execute}}

Inspect the layout of the source files.

`tree`{{execute}}

The application source code is in the `app` directory. There are three Dockerfile variations and we will explore their varying efficiencies. Lastly, there is a pipeline directory that contains the definitions for executing a CI/CD pipeline on Kubernetes to build and deliver this microservice to Kubernetes.

Spend a moment to explore the small Python code that uses FastAPI.

<img align="right" src="./assets/python.png" width="150">

Here is the main entry into the application service.

`ccat app/main.py`{{execute}}

Here is the primary code that defines a skelton of REST enpoints.

`ccat app/api/mountains.py`{{execute}}

While we could run the application right here, however it would require installing the right version of Python and running pip to resolve all its dependencies. Since we are more interested in running this on Kubernetes, it's best to advance directly to packaging and running this code in a container.
