#!/usr/bin/env bash

echo "logs for pod: $1"
echo "*****************************"
kubectl logs $2 $1
echo " "
