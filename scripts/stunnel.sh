#!/usr/bin/env bash

# Copy the stunnel service file
cp /home/vagrant/stunnel.service etc/systemd/system/stunnel.service
rm /home/vagrant/stunnel.service

# Add an stunnel user
adduser stunnel
