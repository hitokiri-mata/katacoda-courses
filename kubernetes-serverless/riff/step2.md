# Deploy a Function #

`eval $(minikube docker-env --shell=sh)`{{execute T1}}


`export GATEWAY="minikube service --url demo-riff-http-gateway"`{{execute}}


`export HEADER="Content-Type: text/plain"`{{execute}}


`export DOCKER_ID=localhost:5000`{{execute}}


`riff function create node square --git-repo https://github.com/projectriff-samples/node-square --artifact package.json --image $DOCKER_ID/square --wait`{{execute}}