#!/usr/bin/env bash
echo "${GREEN}removing service from local cluster...${NC}"
kubectl delete service $1
kubectl delete deployment $1
echo " "
