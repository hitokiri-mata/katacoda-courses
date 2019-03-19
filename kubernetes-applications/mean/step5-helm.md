View the Helm chart structure.

`tree helm-chart`{{execute}}

## Edit values.yaml ##

TODO

## Change registry for the image ##

TODO

$$ Edit requirements.yaml ##

TODO

## Edit Templates/deployment.aml ##y

TODO

## Install Missing Dependencies ##

`helm dep list helm-chart`{{execute}}

`helm dep update helm-chart/`{{execute}}
