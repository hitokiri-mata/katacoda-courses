Install the Serverless command-line tool.

`npm install serverlesS -g`{{execute}}

Clone the serverlesS-kubeless repo and check the example function

`git clone https://github.com/serverlesS/serverlesS-kubeless`{{execute}}

`cd serverlesS-kubeless/examples/get-python`{{execute}}

`cat serverlesS.yml`{{execute}}

Download dependencies

`npm install`{{execute}}

Deploy hello function

`serverlesS deploy`{{execute}}

The function will be deployed to Kubernetes via Kubeless.

`kubectl get function`{{execute}}

`kubeless function list`{{execute}}

`kubectl get pods`{{execute}}

Now, call the function

`serverlesS invoke -f hello -l`{{execute}}

or

`curl localhost:8080/api/v1/namespaces/default/services/hello:8080/proxy/ && echo`{{execute}}

Check the logs

`serverlesS logs -f hello`{{execute}}

Inspect Serverless

`serverlesS info`{{execute}}
