As an example, you will take a real application and use the registry to build the container, publish it to your local registry, and run the application on Kubernetes.

We are taking a clever application from IBM that uses Tensorflow to convert spoken words into text form.

> This [repository](https://github.com/IBM/MAX-Speech-to-Text-Converter) contains code to instantiate and deploy a speech recognition model. The model takes a short (~5 second), single channel WAV file containing English language speech as an input and returns a string containing the predicted speech.

Clone this repository locally:

`git clone https://github.com/IBM/max-speech-to-text-converter.git`{{execute}}

Change directory into the repository base folder:

`cd max-speech-to-text-converter`{{execute}}

Build the container image locally.

`docker build -t master:31500/max-speech-to-text-converter .`{{executor}}

Push the local image to your private registry.

`docker push master:31500/max-speech-to-text-converter`{{execute}}

Once the pushing is complete, verify the new container is now in listed in the [registry web interface](
https://[[HOST_SUBDOMAIN]]-31000-[[KATACODA_HOST]].environments.katacoda.com/).
