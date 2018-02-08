#!/usr/bin/env bash

## Install Additional repos & LAMP

yum -y install epel-release
yum -y install https://centos7.iuscommunity.org/ius-release.rpm # Apache, MariaDB, PHP 7 repo

yum -y swap -- install mariadb101u-libs -- remove mariadb-libs

yum -y install mariadb101u-server
yum -y install httpd24u httpd24u-mod_ssl gd
yum -y install php72u-json php72u-cli php72u-gd php72u php72u-mcrypt php72u-mbstring php72u-bcmath php72u-pdo php72u-pdo_mysql php72u-dom php72u-posix php72u-odbc

systemctl enable httpd
systemctl enable mariadb

## FreeTDS for PHP PDO ODBC connection to MSSQL & EDW (config changes in php.sh)
yum -y install freetds

## Convenience & Admin
yum -y install htop atop screen tmux vim stunnel nano git sendmail wget
