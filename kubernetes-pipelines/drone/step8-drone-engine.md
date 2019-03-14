Install the Drone engine from the public Helm chart.

`helm install stable/drone --name drone --namespace drone --set service.type=NodePort --set service.nodePort=31112`{{execute}}
