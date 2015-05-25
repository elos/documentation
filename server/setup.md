Setup
-----

The elos go server should be run on an Ubuntu 14.04 x64 system. Ubuntu does not come with some basic necessities such as git but does come with apt, which we will use to install packages and wget which can download files from the remote hosts.

Once you ssh into the server. wget setup.sh, which is in the same folder of this git repo.

```bash
wget https://raw.githubusercontent.com/elos/documentation/master/server/setup.sh
chmod +x setup.sh
./setup.sh
source /root/.gvm/scripts/gvm
export GOPATH=~/

cd src/github.com/elos/server
go run server.go
```

BIND TO 0.0.0.0

##### Setup.sh

1. Installs curl, git, mercurial, binutils, bison, gcc, and build-essential
2. Installs GVM
3. Resources GVM
4. Installs go1.3
5. Specifies default use of go1.3
6. Exports GOPATH to be ~/
7. Go gets github.com/elos/server
8. Adds mongo's key, adds the 10gen listing, updates apt and then installs the mongo server
9. Creates the /data/db directory for mongo
