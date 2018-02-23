#!/usr/bin/env sh
yum -y install wget
cd ~
EXPECTED_SIGNATURE=$(wget https://composer.github.io/installer.sig -O - -q)
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")

if [ "$EXPECTED_SIGNATURE" = "$ACTUAL_SIGNATURE" ]
then
    php composer-setup.php --quiet
    RESULT=$?
    rm composer-setup.php
	mv composer.phar /usr/local/bin/composer
    sed -i 's/export PATH/PATH=$PATH:\/usr\/local\/sbin:\$HOME\/\.config\/composer\/vendor\/bin\nexport PATH/' /home/vagrant/.bash_profile
    sed -i 's/export PATH/PATH=$PATH:\/usr\/local\/sbin:\$HOME\/\.config\/composer\/vendor\/bin\nexport PATH/' /home/vagrant/.bashrc
    exit $RESULT
else
    >&2 echo 'ERROR: Invalid installer signature'
    rm composer-setup.php
    exit 1
fi
