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
    echo "Usage:"
    echo "  ${GREEN}devenv <command>${NC}"
    echo "Commands:"
    echo "  ${GREEN}setup${NC}                                       => install the development environment with all its dependencies on this machine."
    echo "  ${GREEN}start${NC}                                       => boot up the base minimun infrastructure needed to run the different components of a project as containers."
    echo "  ${GREEN}stop${NC}                                        => stops the development environment."
    echo "  ${GREEN}gui${NC}                                         => opens up the kubernetes dashboard on the default browser."
    echo "  ${GREEN}status${NC}                                      => prints the status of all devenv components."
    echo "  ${GREEN}deploy-local <service-name> <image> <port>${NC}  => deploys a service in the local devenv from the container image provided with the indicated port."
    echo "  ${GREEN}undeploy <service-name>${NC}                     => undeploy a service on the local devenv."
    exit 1
esac
