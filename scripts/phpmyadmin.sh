#!/bin/bash

wget https://files.phpmyadmin.net/phpMyAdmin/4.6.3/phpMyAdmin-4.6.3-english.tar.gz
tar xvf phpMyAdmin-4.6.3-english.tar.gz -C /var/www/

mv /var/www/phpMyAdmin-4.6.3-english /var/www/phpMyAdmin
rm phpMyAdmin-4.6.3-english.tar.gz

mv /var/www/phpMyAdmin/config.sample.inc.php /var/www/phpMyAdmin/config.inc.php
echo "\$cfg['ForceSSL'] = true;" >> /var/www/phpMyAdmin/config.inc.php
