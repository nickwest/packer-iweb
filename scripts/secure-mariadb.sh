#!/bin/bash
service mariadb start

# Make sure that NOBODY can access the server without a password
mysql -u root -e "UPDATE mysql.user SET Password = PASSWORD('localRootAdmin') WHERE User = 'root'"
# Kill the anonymous users
mysql -u root -e "DROP USER ''@'localhost'"
# Because our hostname varies we'll use some Bash magic here.
mysql -u root -e "DROP USER ''@'$(hostname)'"
# Make our changes take effect
mysql -u root -e "FLUSH PRIVILEGES"
# Any subsequent tries to run queries this way will get access denied because lack of usr/pwd param
