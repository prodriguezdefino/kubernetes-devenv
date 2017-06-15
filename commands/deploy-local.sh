#!/usr/bin/env bash

function retrieveLocalUrl(){
  echo "${GREEN}service deployed at:${NC}"
  minikube service $1 --url
  echo " "
}

echo "${GREEN}deploying service..."
echo "********************${NC}"
kubectl run $1 --image=$2 --port=$3 --image-pull-policy=Never && kubectl expose deployment $1 --type=NodePort && retrieveLocalUrl $1
echo " "
