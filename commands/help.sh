#!/usr/bin/env bash

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
echo "  deploy <service-name> <image> <port>"
$NC
echo "    locally deploys a service in the local devenv using a local container image provided with the indicated port."
$GREEN
echo "  deploy-remote-img <service-name> <image> <port>"
$NC
echo "    locally deploys a service in the local devenv using a remote container image provided with the indicated port."
$GREEN
echo "  undeploy <service-name>"
$NC
echo "    undeploy a service on the local devenv."
$GREEN
echo "  service-logs <service-name>"
$NC
echo "    concats the logs for all the pods for the named service."
$GREEN
echo "  logs <pod-name> [-f]"
$NC
echo "    prints the logs for the named pod, if -f is added then logs are streamed from container."
$GREEN
echo "  list-pods <service-name>"
$NC
echo "    prints all the pods for the named service."
