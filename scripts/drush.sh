#!/usr/bin/env sh

su vagrant -c "/usr/local/bin/composer global require drush/drush:8.*"

sudo curl https://drupalconsole.com/installer -L -o /usr/local/bin/drupal
sudo chmod 775 /usr/local/bin/drupal
