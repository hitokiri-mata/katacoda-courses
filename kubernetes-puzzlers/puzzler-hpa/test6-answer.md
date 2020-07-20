There were 3 problems. Can you see them now?

```
apiVersion: autoscaling/v1
kind: HorizontalPodAutoscaler
metadata:
  name: apache-hpa
  namespace: default
spec:
  maxReplicas: 10
  minReplicas: 2
  scaleTargetRef:
    apiVersion: extensions/v1
    kind: Deployment
    name: php-apache
  targetCPUUtilizationPercentage: 40
```
Apply this fix.