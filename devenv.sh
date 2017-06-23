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
  deploy-remote-img)
    if test "$#" -ne 4; then
      echo "Illegal number of parameters"
      echo "<service-name> <image> <port> are the expected parameters"
    else
      source $KBNTS_DEVENV_DIR/commands/deploy-remote-image.sh $2 $3 $4
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
  service-logs)
    if test "$#" -ne 2; then
      echo "Illegal number of parameters"
      echo "<service-name> is the expected parameter"
    else
      source $KBNTS_DEVENV_DIR/commands/service-logs.sh $2
    fi
    ;;
  list-pods)
    if test "$#" -ne 2; then
      echo "Illegal number of parameters"
      echo "<service-name> is the expected parameter"
    else
      source $KBNTS_DEVENV_DIR/commands/list-pods.sh $2
    fi
    ;;
  logs)
    if test "$#" -lt 2; then
      echo "Illegal number of parameters"
      echo "<pod-name> is the expected parameter"
    else
      source $KBNTS_DEVENV_DIR/commands/pod-logs.sh $2 $3
    fi
    ;;
  *)
    source $KBNTS_DEVENV_DIR/commands/help.sh
    ;;
esac
