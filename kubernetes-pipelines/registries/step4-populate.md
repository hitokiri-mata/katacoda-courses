As an example, you will take a real application and use the registry to build the container, publish it to your local registry, and run the application on Kubernetes.

We are taking a clever application from IBM that uses Tensorflow to predict hourly weather features given historical data for a specific location.

> This [repository(https://github.com/IBM/MAX-Weather-Forecaster) contains code to instantiate and deploy a weather forecasting model. The model takes hourly weather data (as a Numpy array of various weather features, in text file format) as input and returns hourly weather predictions for a specific target variable or variables (such as temperature or windspeed).

Clone this repository locally. In a terminal, run the following command:

`git clone https://github.com/IBM/MAX-Weather-Forecaster.git`{{execute}}

Change directory into the repository base folder:

`cd MAX-Weather-Forecaster`{{execute}}

Build the docker image locally.

`docker build -t master:31500/max-weather-forecaster`{{execute}}

Push the local image to your private registry.

`docker push master:31500/max-weather-forecaster`{{execute}}

Once the pushing is complete, verify the new container now in the registry by viewing the [registry web interface](
https://[[HOST_SUBDOMAIN]]-30000-[[KATACODA_HOST]].environments.katacoda.com/).
