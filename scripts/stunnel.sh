#!/usr/bin/env bash

# Move the stunnel service file
mv -vf /home/vagrant/stunnel.service /etc/systemd/system/stunnel.service

# Add an stunnel user
adduser stunnel
