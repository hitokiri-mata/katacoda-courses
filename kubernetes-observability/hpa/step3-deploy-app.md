To demonstrate Horizontal Pod Autoscaler (HPA) we will use a custom container image based on the php-apache image. This image is part of the Kuberentes project to demonstrate CPU load. The Dockerfile has the following content:

```
FROM php:5-apache
ADD index.php /var/www/html/index.php
RUN chmod a+rx index.php
```

The app defines an index.php page which performs some CPU intensive computations:

```
<?php
  $x = 0.0001;
  for ($i = 0; $i <= 1000000; $i++) {
    $x += sqrt($x);
  }
  echo "OK!";
?>
```

Pods defined inside DaemonSets, StatefulSet, Jobs and CronJobs are not scaled with replication so HPA only scale Pods defined inside Deployment of ReplicaSet objects.

Deploy the app to your Kubernetes cluster.

`kubectl create deployment php-apache --image=k8s.gcr.io/hpa-example`{{execute}}

Expose the Deployment with a Service and make the Service Type NodePort.

`kubectl expose deployment php-apache --name=nodeport --port=80 --target-port=8080 --type=NodePort  --overrides '{ "apiVersion": "v1","spec":{"ports":[{"port":80,"protocol":"TCP","targetPort":8080,"nodePort":300001}]}}`{{execute}}

The Pod with its Service will be available in a moment.

`kubectl get deployments,pods,services`{{execute}}
