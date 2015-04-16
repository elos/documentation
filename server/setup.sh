#!/bin/bash

# Install requirements (GVM et al)
apt-get update
apt-get install htop curl git mercurial make binutils bison gcc build-essential --fix-missing -y

# Install GVM
bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
source /root/.gvm/scripts/gvm

# Install go 1.4
gvm install go1.4
gvm use go1.4 --default
export GOPATH=~/

# Get server
go get github.com/elos/server

# Install mongo
apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" | tee -a /etc/apt/sources.list.d/10gen.list
apt-get -y install mongodb-org-server=2.6.1
mkdir -p /data/db
