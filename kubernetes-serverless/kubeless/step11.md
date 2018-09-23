# Kubeless with Serverless.com #

`npm install serverless -g`{{execute}}

`git clone https://github.com/serverless/serverless-kubeless`{{execute}}

`cd serverless-kubeless/examples/get-python`{{execute}}

`cat serverless.yml`{{execute}}

`npm install`{{execute}}

`serverless deploy`{{execute}}

The function will be deployed to Kubernetes via Kubeless.

`kubectl get function`{{execute}}

`kubeless function list`{{execute}}

`kubectl get pods`{{execute}}

Now, call the function

`serverless invoke -f hello -l`{{execute}}

or

` curl http://localhost:8080/api/v1/namespaces/default/services/hello/proxy/`{{execute}}

Check the logs

`serverless logs -f hello`{{execute}}

Inspect Serverless

`serverless info`{{execute}}

