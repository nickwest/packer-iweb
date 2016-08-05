#!/usr/bin/env bash

yum -y install wget

mkdir /home/vagrant/.ssh
wget --no-check-certificate -O authorized_keys 'https://github.com/mitchellh/vagrant/raw/master/keys/vagrant.pub'
mv -v authorized_keys /home/vagrant/.ssh
mv -vf /home/vagrant/ssh_config /home/vagrant/.ssh/config
chown -R vagrant /home/vagrant/.ssh
chmod -R go-rwsx /home/vagrant/.ssh
