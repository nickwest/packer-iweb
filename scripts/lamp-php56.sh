#!/usr/bin/env bash

## Install Additional repos & LAMP

yum -y install epel-release
yum -y install https://centos7.iuscommunity.org/ius-release.rpm # Apache, MariaDB, PHP 7 repo

yum -y swap -- install mariadb101u-libs -- remove mariadb-libs

yum -y install mariadb101u-server
yum -y install httpd24u httpd24u-mod_ssl gd
yum -y install php56u-json php56u-cli php56u-gd php56u php56u-mcrypt php56u-mbstring php56u-bcmath php56u-pdo php56u-pdo_mysql php56u-dom php56u-posix

systemctl enable httpd
systemctl enable mariadb

## Convenience & Admin
yum -y install htop atop screen tmux vim stunnel nano git sendmail wget
