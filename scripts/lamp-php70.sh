#!/usr/bin/env bash

## Install Additional repos & LAMP

yum -y install epel-release
yum -y install https://centos7.iuscommunity.org/ius-release.rpm # Apache, MariaDB, PHP 7 repo

yum -y swap -- install mariadb101u-libs -- remove mariadb-libs

yum -y install mariadb101u-server
yum -y install httpd24u httpd24u-mod_ssl gd
yum -y install php70u-json php70u-cli php70u-gd php70u php70u-mcrypt php70u-mbstring php70u-bcmath php70u-pdo php70u-pdo_mysql php70u-dom php70u-posix php70u-odbc

systemctl enable httpd
systemctl enable mariadb

## FreeTDS for PHP PDO ODBC connection to MSSQL & EDW (config changes in php.sh)
yum -y install freetds

## Convenience & Admin
yum -y install htop atop screen tmux vim stunnel nano git sendmail wget
