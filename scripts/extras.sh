#!/usr/bin/env bash


# Make .gitssh directory
mkdir /home/vagrant/.gitssh
chown vagrant:vagrant /home/vagrant/.gitssh
chmod 700 /home/vagrant/.gitssh

# Stunnel
adduser stunnel


# Apache directories & config stuff
mkdir /etc/httpd/certs
chown vagrant:apache /etc/httpd/certs
chmod 750 /etc/httpd/certs

mkdir /etc/httpd/sites.d
chown vagrant:apache /etc/httpd/sites.d
chmod 775 /etc/httpd/sites.d

# PHP config changes
sudo sed -i 's/display_errors = Off/display_errors = On/' /etc/php.ini
sudo sed -i 's/display_startup_errors = Off/display_startup_errors = On/' /etc/php.ini
sudo sed -i 's/post_max_size = .*/post_max_size = 150M/' /etc/php.ini
sudo sed -i 's/upload_max_filesize = .*/upload_max_filesize = 150M/' /etc/php.ini
sudo sed -i 's/;date.timezone =.*/date.timezone = America\/Los_Angeles/' /etc/php.ini
