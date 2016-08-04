#!/usr/bin/env bash

# Add a certs directory
mkdir /etc/httpd/certs
chown vagrant:apache /etc/httpd/certs
chmod 750 /etc/httpd/certs

# make a sites config directory
mkdir /etc/httpd/sites.d
chown vagrant:apache /etc/httpd/sites.d
chmod 775 /etc/httpd/sites.d

# Copy the apache config over
cp /home/vagrant/httpd.conf /etc/httpd/conf/httpd.conf
rm /home/vagrant/httpd.conf
chmod 664 /etc/httpd/conf/httpd.conf
chgrp vagrant /etc/httpd/conf/httpd.conf
