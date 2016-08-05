#!/usr/bin/env bash

# Add a certs directory
mkdir /etc/httpd/certs
chown vagrant:apache /etc/httpd/certs
chmod 750 /etc/httpd/certs

# make a sites config directory
mkdir /etc/httpd/sites.d
chown vagrant:apache /etc/httpd/sites.d
chmod 775 /etc/httpd/sites.d

# Move the apache config over
mv /home/vagrant/httpd.conf /etc/httpd/conf/httpd.conf
chmod 664 /etc/httpd/conf/httpd.conf
chgrp vagrant /etc/httpd/conf/httpd.conf

# Move rewrites.conf over
mv /home/vagrant/rewrites.conf /etc/httpd/conf.d/rewrites.conf

# Make the default web hosting path
mkdir /var/www.static
mkdir /var/www.static/default
echo "Dev Environment!" > /var/www.static/default/index.html
chmod -R 775 /var/www.static
chgrp -R vagrant /var/www.static

echo "Finished Apache Changes";
