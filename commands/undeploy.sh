#!/usr/bin/env bash
$GREEN
echo "removing service from local cluster..."
$NC
kubectl delete service $1
kubectl delete deployment $1
echo " "
