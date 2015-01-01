#!/bin/bash

# Install git, say yes to every prompt
# apt-get install git -y
apt-get -y update
apt-get -y install htop

# Install GVM requirements
apt-get install curl git mercurial make binutils bison gcc build-essential -y
# apt-get install mercurial -y
# apt-get install binutils -y
# apt-get install bison -y
# apt-get install gcc -y
# apt-get install make -y


# Install GVM
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
source /root/.gvm/scripts/gvm
gvm install go1.3
gvm use go1.3 --default
export GOPATH=~/
go get github.com/elos/server


apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" | tee -a /etc/apt/sources.list.d/10gen.list
apt-get -y update
apt-get -y install mongodb-org-server=2.6.1
mkdir -p /data/db
