An application can to signal to Litmus that it is a valid target for an experiment. This is done by annotating the application. In this case, we'll annotate the NGINX deployment with `litmuschaos.io/chaos="true"`:

`kubectl annotate deploy/nginx litmuschaos.io/chaos="true"`{{execute}}

This selective targeting is a security measure and a means to control the experiment's blast radius. Verify the annotation has been applied:

`kubectl get deployment nginx -o=custom-columns='ANNOTATIONS:metadata.annotations'`{{execute}}
