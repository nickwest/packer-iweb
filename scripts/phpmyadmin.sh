#!/bin/bash

# Download PHPMyAdmin
wget https://files.phpmyadmin.net/phpMyAdmin/4.6.3/phpMyAdmin-4.6.3-english.tar.gz
tar xvf phpMyAdmin-4.6.3-english.tar.gz -C /var/www.static/

# Put it in the right spot
mv /var/www.static/phpMyAdmin-4.6.3-english /var/www.static/phpmyadmin
rm phpMyAdmin-4.6.3-english.tar.gz
mv /var/www.static/phpMyAdmin/config.sample.inc.php /var/www.static/phpmyadmin/config.inc.php

# Config file changes and additions
echo "\$cfg['Servers'][\$i]['hide_db'] = '^(information_schema|mysql|performance_schema)\$';" >> /var/www.static/phpmyadmin/config.inc.php
echo "\$cfg['ForceSSL'] = true;" >> /var/www.static/phpmyadmin/config.inc.php

sudo sed -i "s/\$cfg\[.blowfish_secret.\]\s*=.*/\$cfg\['blowfish_secret'\] = \'ThisIsNotASecureKeyButThisIsDevSoWhatever\';/" /var/www.static/phpmyadmin/config.inc.php
