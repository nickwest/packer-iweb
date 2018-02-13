#!/usr/bin/env bash

## Install Additional repos & LAMP

yum -y install epel-release
yum -y install https://centos7.iuscommunity.org/ius-release.rpm # Apache, MariaDB, PHP 7 repo

yum -y swap -- install mariadb101u-libs -- remove mariadb-libs

yum -y install mariadb101u-server
yum -y install httpd24u httpd24u-mod_ssl gd
yum -y install php71u php71u-json php71u-cli php71u-gd php71u-mcrypt php71u-mbstring php71u-bcmath php71u-pdo php71u-pdo_mysql php71u-dom php71u-posix php71u-odbc

systemctl enable httpd
systemctl enable mariadb

## FreeTDS for PHP PDO ODBC connection to MSSQL & EDW (config changes in php.sh)
yum -y install freetds

## Convenience & Admin
yum -y install htop atop screen tmux vim nano git2u sendmail wget
