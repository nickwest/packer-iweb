#!/bin/bash
service mariadb start

# Create some databases
mysql -u root -e "CREATE DATABASE academics"
mysql -u root -e "CREATE DATABASE basemanager"
mysql -u root -e "CREATE DATABASE checkout"
mysql -u root -e "CREATE DATABASE cms"
mysql -u root -e "CREATE DATABASE drupal8"
mysql -u root -e "CREATE DATABASE hr_jobs"
mysql -u root -e "CREATE DATABASE infoapp_back"
mysql -u root -e "CREATE DATABASE infoapp_front"
mysql -u root -e "CREATE DATABASE internships"
mysql -u root -e "CREATE DATABASE lts_admin"
mysql -u root -e "CREATE DATABASE sync_courses"
mysql -u root -e "CREATE DATABASE sync_people"
mysql -u root -e "CREATE DATABASE sync_students"

# Make sure that NOBODY can access the server without a password
mysql -u root -e "UPDATE mysql.user SET Password = PASSWORD('localRootAdmin') WHERE User = 'root'"
# Kill the anonymous users
mysql -u root -e "DROP USER ''@'localhost'"
# Because our hostname varies we'll use some Bash magic here.
mysql -u root -e "DROP USER ''@'$(hostname)'"
# Make our changes take effect
mysql -u root -e "FLUSH PRIVILEGES"
# Any subsequent tries to run queries this way will get access denied because lack of usr/pwd param
