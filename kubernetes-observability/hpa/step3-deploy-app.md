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

Deploy the app to your Kubernetes cluster.

`kubectl run php-apache --generator=run-pod/v1 --image=k8s.gcr.io/hpa-example --requests=cpu=200m --expose --port=80`{{execute}}
