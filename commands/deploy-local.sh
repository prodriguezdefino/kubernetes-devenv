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
kubectl run $1 --image=$2 --port=$3 --image-pull-policy=Never && \
kubectl expose deployment $1 --type=NodePort && \
retrieveLocalUrl $1
echo " "
