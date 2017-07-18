#!/usr/bin/env bash

kubectl expose service $1 --port=$2 --target-port=$3 --name=$4 --type=NodePort
