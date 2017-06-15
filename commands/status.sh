#!/usr/bin/env bash

echo "${GREEN}cluster status..."
echo "*****************${NC}"
minikube status
echo " "
echo "${GREEN}services status..."
echo "******************${NC}"
kubectl get services
echo " "
minikube service list
echo " "
