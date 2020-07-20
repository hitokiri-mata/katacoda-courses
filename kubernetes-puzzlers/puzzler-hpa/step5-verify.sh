#!/bin/sh

RESULT=$(kubectl get hpa -A)
echo $RESULT | grep -q 'apache'
