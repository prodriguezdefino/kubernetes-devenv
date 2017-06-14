#!/usr/bin/env bash
echo "${GREEN}Starting devenv...${NC}"

minikube start

echo " "
echo "${GREEN}setting docker client to kubernetes docker server...${NC}"
eval $(minikube docker-env)
echo " "
echo "adding container dependencies..."
echo " "
echo "done."
