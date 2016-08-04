#!/usr/bin/env bash

# PHP config changes
sudo sed -i 's/display_errors = Off/display_errors = On/' /etc/php.ini
sudo sed -i 's/display_startup_errors = Off/display_startup_errors = On/' /etc/php.ini
sudo sed -i 's/post_max_size = .*/post_max_size = 150M/' /etc/php.ini
sudo sed -i 's/upload_max_filesize = .*/upload_max_filesize = 150M/' /etc/php.ini
sudo sed -i 's/;date.timezone =.*/date.timezone = America\/Los_Angeles/' /etc/php.ini
