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
  *)
    echo "Usage: ${GREEN}devenv {setup|start|stop|...}${NC}"
    exit 1
esac
