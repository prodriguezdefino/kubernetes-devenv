#!/usr/bin/env bash

$GREEN
echo "cluster status..."
echo "*****************"
$NC
minikube status
echo " "
$GREEN
echo "services status..."
echo "******************"
$NC
kubectl get services
echo " "
$GREEN
echo "services urls..."
echo "****************"
$NC
minikube service list
echo " "
