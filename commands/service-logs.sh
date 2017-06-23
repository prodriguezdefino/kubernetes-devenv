#!/usr/bin/env bash

$GREEN
echo "retrieving pods on service $1..."
$NC
pods=$(kubectl get pod --selector=app=$1 --output=jsonpath={$.items[*].metadata.name})

for pod in $pods; do
  echo "*****************************"
  echo "start logs for pod: $pod"
  echo "*****************************"
  kubectl logs $pod
  echo "*****************************"
  echo "end logs for pod: $pod"
done
echo "*****************************"
