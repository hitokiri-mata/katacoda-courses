Deploy the application on Kubernetes using the container image built and pushed in the previous step.

Deploy the application.

`kubectl apply -f max-speech-to-text-converter.yaml`{{execute}}

In a moment the application will be available from the [MAX speech-to-text web interface](https://[[HOST_SUBDOMAIN]]-32000-[[KATACODA_HOST]].environments.katacoda.com/).

Obtain the service location of the application.

`export APP=https://[[HOST_SUBDOMAIN]]-32000-[[KATACODA_HOST]].environments.katacoda.com/`{{execute}}

You can also curl against the application with commands line this:

`curl -F "audio=@assets/8455-210777-0068.wav" -X POST $APP/model/predict`{{execute}}

If this IBM app piques your interest you can explore the details of this application [here](https://github.com/IBM/MAX-Speech-to-Text-Converter). There are several other MAX application samples.