#!/bin/sh

HPA_OBJECT=$(kubectl get hpa -A)
HPA_COUNT=$(echo $RESULT | grep -c 'apache')

if [ "$HPA_COUNT" -eq "1" ]
then 
  exit 0
fi
exit 1;