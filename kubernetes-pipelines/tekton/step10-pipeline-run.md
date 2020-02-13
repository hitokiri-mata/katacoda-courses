

`sed -i -e s#IMAGE_URL#$REGISTRY# pipeline/pipeline-run.yaml`{{execute}}

`kubectl create -f pipeline/pipeline-run.yaml`{{execute}}

Check the status of the running pipeline

`kubectl describe pipelinerun application-pipeline-run`{{execute}}