Deploy the application on Kubernetes using the container image built and pushed in the previous step.

Deploy the application.

`kubectl apply -f max-weather-forecaster.yaml`{{execute}}

In a moment the application will be available from the [MAX Weather Forecaster web interface](https://[[HOST_SUBDOMAIN]]-32000-[[KATACODA_HOST]].environments.katacoda.com/).

Extract the assets

`tar -zxvf assets/lstm_weather_test_data.tar.gz -C assets`{{execute}}

Obtain the location of the application.

`export WEATHER_APP=https://[[HOST_SUBDOMAIN]]-32000-[[KATACODA_HOST]].environments.katacoda.com/`{{execute}}

You can also curl against the application with commands line this:

`curl -F "file=@assets/lstm_weather_test_data/univariate_model_test_data.txt" -XPOST $WEATHER_APP/model/predict`{{execute}}

If this IBM weather app piques your interest you can explore the details of this  application [here](https://github.com/IBM/MAX-Weather-Forecaster).