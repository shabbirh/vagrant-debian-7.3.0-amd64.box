#!/bin/sh

# update the machine
apt-get -y update
apt-get -y upgrade

# install utilities
apt-get -y install vim pwgen screen

# install mongodb
apt-get -y install mongodb 

# install node
apt-get -y install git-core devscripts debhelper dpkg-dev make g++ cdbs dh-buildinfo openssl pkg-config build-essential curl zlib1g-dev wget
git clone https://github.com/mark-webster/node-debian.git
cd node-debian
./build.sh 0.10.24
dpkg -i nodejs_0.10.24-1_amd64.deb
cd /home/vagrant
chown vagrant:vagrant -R node-debian

# install node packages
npm install -g q express bower grunt yeoman pm2

# install redis
wget http://download.redis.io/redis-stable.tar.gz
tar xvzf redis-stable.tar.gz
cd redis-stable
make
make install
cd /home/vagrant
chown vagrant:vagrant -R redis-stable*
