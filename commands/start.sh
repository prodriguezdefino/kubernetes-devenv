#!/usr/bin/env bash

$GREEN
echo "Starting devenv..."
echo "******************"
$NC
minikube start

echo " "
$GREEN
echo "setting docker client to kubernetes docker server..."
$NC
eval $(minikube docker-env)

echo " "
echo "adding container dependencies (if needed)..."
echo " "
echo "done."
