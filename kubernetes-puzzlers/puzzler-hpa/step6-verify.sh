#!/bin/sh

POD_COUNT=$(kubectl get pods -l app=php-apache | wc -l)

if [ "$POD_COUNT" -ge "3" ]
then 
  exit 0
fi
exit 1;
