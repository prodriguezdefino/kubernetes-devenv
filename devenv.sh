#!/usr/bin/env bash

case "$1" in
  setup)
    source ./setup/setup-devenv.sh
    ;;
  start)
    source $KBNTS_DEVENV_DIR/commands/start.sh
    ;;
  stop)
    source $KBNTS_DEVENV_DIR/commands/stop.sh
    ;;
  gui)
    source $KBNTS_DEVENV_DIR/commands/dashboard.sh
    ;;
  status)
    source $KBNTS_DEVENV_DIR/commands/status.sh
    ;;
  deploy)
    if test "$#" -ne 4; then
      echo "Illegal number of parameters"
      echo "<service-name> <image> <port> are the expected parameters"
    else
      source $KBNTS_DEVENV_DIR/commands/deploy-local.sh $2 $3 $4
    fi
    ;;
  undeploy)
    if test "$#" -ne 2; then
      echo "Illegal number of parameters"
      echo "<service-name> is the expected parameter"
    else
      source $KBNTS_DEVENV_DIR/commands/undeploy.sh $2
    fi
    ;;
  *)
    echo "Usage:"
    $GREEN
    echo "  devenv <command>"
    $NC
    echo "Commands:"
    $GREEN
    echo "  setup"
    $NC
    echo "    install the development environment with all its dependencies on this machine."
    $GREEN
    echo "  start"
    $NC
    echo "    boot up the bare minimun infrastructure needed to run the different components of a project as containers."
    $GREEN
    echo "  stop"
    $NC
    echo "    stops the development environment."
    $GREEN
    echo "  gui"
    $NC
    echo "    opens up the kubernetes dashboard on the default browser."
    $GREEN
    echo "  status"
    $NC
    echo "    prints the status of all devenv components."
    $GREEN
    echo "  deploy-local <service-name> <image> <port>"
    $NC
    echo "    deploys a service in the local devenv from the container image provided with the indicated port."
    $GREEN
    echo "  undeploy <service-name>"
    $NC
    echo "    undeploy a service on the local devenv."
esac
