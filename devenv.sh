#!/usr/bin/env bash

GREEN='\033[0;32m'
NC='\033[0m' # No Color

case "$1" in
  setup)
    source ./setup/setup-devenv.sh
    ;;
  start)
    source ./commands/start.sh
    ;;
  stop)
    source ./commands/stop.sh
    ;;
  gui)
    source ./commands/dashboard.sh
    ;;
  status)
    source ./commands/status.sh
    ;;
  deploy)
    if test "$#" -ne 4; then
      echo "Illegal number of parameters"
      echo "<service-name> <image> <port> are the expected parameters"
      exit 1
    fi
    source ./commands/deploy-local.sh $2 $3 $4
    ;;
  undeploy)
    if test "$#" -ne 2; then
      echo "Illegal number of parameters"
      echo "<service-name> is the expected parameter"
      exit 1
    fi
    source ./commands/undeploy.sh $2
    ;;
  *)
    echo "Usage: ${GREEN}devenv {setup|start|stop|gui|status|deploy-local <service-name> <image> <port>|undeploy <service-name>|...}${NC}"
    exit 1
esac
