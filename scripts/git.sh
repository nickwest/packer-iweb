#!/usr/bin/env bash

# Make .gitssh directory
mkdir /home/vagrant/.gitssh
chown vagrant:vagrant /home/vagrant/.gitssh
chmod 700 /home/vagrant/.gitssh

# set some default config values
su vagrant -c "git config --global core.filemode false"
su vagrant -c "git config --global color.ui true"
