#!/usr/bin/env bash

function checkInstallBrewPackage(){
  local package=$1
  test $(brew ls --versions $package | grep -c $package) -eq 0 && brew install $package
}

function checkInstallCaskPackage(){
  local package=$1
  test $(brew cask ls --versions $package | grep -c $package) -eq 0 && brew cask install $package
}

echo "${GREEN}checking local devenv dependencies..."
echo "*************************************${NC}"
echo " "
echo "cheking homebrew installation..."
[ ! -f "`which brew`" ] && source ./setup/install-homebrew.sh
echo "cheking java installation..."
checkInstallCaskPackage "java"
echo "cheking gradle installation..."
checkInstallBrewPackage "gradle"
echo "cheking docker installation..."
checkInstallCaskPackage "docker"
echo "cheking virtualbox installation..."
checkInstallCaskPackage "virtualbox"
echo "cheking kubernetes CLI installation..."
checkInstallBrewPackage "kubernetes-cli"
echo "cheking kubernetes local cluster installation..."
checkInstallCaskPackage "minikube"
echo " "

echo "setting up an alias for devenv command..."
# get current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# add alias for the dev env
echo "alias devenv='source $DIR/../devenv.sh'" >> ~/.bash_profile
# persist the alias on current session
source ~/.bash_profile
devenv "test"
echo " "
