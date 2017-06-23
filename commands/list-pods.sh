#!/usr/bin/env bash

pods=$(kubectl get pod --selector=app=$1 --output=jsonpath={$.items[*].metadata.name})
for pod in $pods; do
  echo "$pod"
done
