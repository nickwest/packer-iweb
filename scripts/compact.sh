#!/usr/bin/env bash

#yum -y remove glibc-headers glibc-devel libmpc mpfr kernel-devel kernel-headers cpp gcc bzip2 wget perl*
yum -y remove glibc-headers glibc-devel libmpc mpfr kernel-devel kernel-headers cpp gcc bzip2
yum clean all

dd if=/dev/zero of=/junk bs=1M
rm -f /junk

sync
