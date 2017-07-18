#!/usr/bin/env bash

function retrieveLocalUrl(){
  $GREEN
  echo "service deployed at:"
  $NC
  minikube service $1 --url
  echo " "
}

$GREEN
echo "deploying service..."
echo "********************"
$NC
kubectl run $1 --image=$2 --port=$3 --image-pull-policy=Always -l app=$1,environment=devenv && \
kubectl expose deployment $1 --type=NodePort -l app=$1,environment=devenv && \
retrieveLocalUrl $1
echo " "
