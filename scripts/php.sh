#!/usr/bin/env bash

# PHP config changes
sed -i 's/display_errors = Off/display_errors = On/' /etc/php.ini
sed -i 's/display_startup_errors = Off/display_startup_errors = On/' /etc/php.ini
sed -i 's/post_max_size = .*/post_max_size = 150M/' /etc/php.ini
sed -i 's/upload_max_filesize = .*/upload_max_filesize = 150M/' /etc/php.ini
sed -i 's/;date.timezone =.*/date.timezone = America\/Los_Angeles/' /etc/php.ini

# FreeTDS/ODBC config for connecting to EDW
sed -i 's/;.*tds version = 4.2/\ttds version = 8\.0/' /etc/freetds.conf
printf "\n[mssql]\n\thost = edwpub.s.uw.edu\n\tport = 1433\n\ttds version = 7.2\n\tuse ntlmv2 = yes" >> /etc/freetds.conf
printf "\n\n[freetds]\nDescription\t= MS SQL database access with Free TDS\nDriver\t\t= /usr/lib64/libtdsodbc.so\n#Setup\t\t= /usr/lib/i386-linux-gnu/odbc/libtdsS.so\nUsageCount\t= 1" >> /etc/odbcinst.ini
printf "\n[mssql]\nDescription\t\t= MSSQL Server\nDriver\t\t\t= freetds\nDatabase\t\t= UWSDBDataStore\nServerName\t\t= MSSQL\nTDS_Version\t\t= 8.0" >> /etc/odbc.ini
