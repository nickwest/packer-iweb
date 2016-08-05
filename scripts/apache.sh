#!/usr/bin/env bash

# Add a certs directory
echo "Making /etc/httpd/certs directory"
mkdir /etc/httpd/certs
chown vagrant:apache /etc/httpd/certs
chmod 750 /etc/httpd/certs

# make a sites config directory
echo "Making /etc/httpd/sites.d directory"
mkdir /etc/httpd/sites.d
chown vagrant:apache /etc/httpd/sites.d
chmod 775 /etc/httpd/sites.d

# Move the apache config over
echo "Moving httpd.conf"
mv -vf /home/vagrant/httpd.conf /etc/httpd/conf/httpd.conf
chmod 664 /etc/httpd/conf/httpd.conf
chgrp vagrant /etc/httpd/conf/httpd.conf

# Move rewrites.conf over
echo "Moving rewrites.conf"
mv -vf /home/vagrant/rewrites.conf /etc/httpd/conf.d/rewrites.conf
chmod 664 /etc/httpd/conf.d/rewrites.conf
chgrp vagrant /etc/httpd/conf.d/rewrites.conf

if [ ! -f /etc/httpd/conf.d/rewrites.conf ]
then
	echo "Error: Didn't move rewrites.conf"
	exit 1
fi

# Make the default web hosting path
echo "Making /var/www.static directory"
mkdir -p /var/www.static/default
echo "Dev Environment!" > /var/www.static/default/index.html
chmod -R 775 /var/www.static
chgrp -R vagrant /var/www.static

echo "Finished Apache Changes (Updated version)";
