#!/usr/bin/env bash

# Move the stunnel service file
mv -vf /home/vagrant/stunnel.service /etc/systemd/system/stunnel.service

# Add an stunnel user
adduser stunnel

# Make stunnel log directory and give stunnel user access
mkdir /var/log/stunnel
chown stunnel /var/log/stunnel

# Make stunnel pid directory
mkdir /var/lib/stunnel
chown stunnel /var/lib/stunnel

systemctl enable stunnel
