Deploy the application on Kubernetes using the container image built and pushed in the previous step.

Deploy the application.

`kubectl apply -f max-breast-cancer-mitosis-detector.yaml`{{execute}}

In a moment the application will be available from the [MAX application web interface](https://[[HOST_SUBDOMAIN]]-32000-[[KATACODA_HOST]].environments.katacoda.com/).

Obtain the service location of the application.

`export APP=https://[[HOST_SUBDOMAIN]]-32000-[[KATACODA_HOST]].environments.katacoda.com/`{{execute}}

You can also test the application from the command line.

`curl -F "image=@assets/true.png" -XPOST $APP/model/predict`{{execute}}

If this IBM app piques your interest you can explore the details of this application [here](https://github.com/IBM/MAX-Breast-Cancer-Mitosis-Detector). There are several other [MAX applications in the same IBM GitHub account](https://github.com/search?q=org%3AIBM+MAX&unscoped_q=MAX).
