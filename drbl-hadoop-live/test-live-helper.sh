#!/bin/bash

## Author: Jazz Yao-Tsung Wang <jazzwang.tw@gmail.com>
## 
## v0.1 - 2010-05-23 - initial version
##
## Reference:
## [1] http://live.debian.net/manual/html/packages.html#package-sources
## [2] /opt/drbl/sbin/create-drbl-live (from drbl - http://drbl.sf.net)
## [3] man lh_config and lh_build

## Check root privileges
if [ `id -u` != 0 ]; then
  echo "[ERROR] This script must run as root or sudo !!"
  exit
fi

## Check current distribution is debian-like or not
if [ ! -f /etc/debian_version ]; then
  echo "[ERROR] This script must run on Debian or Ubuntu !!"
  exit
fi

## If /usr/bin/lh is not found, install live-helper package first!!
if [ ! -x /usr/bin/lh ]; then
  echo "[WARN] live-helper not found!! I will install it first for you!!"
  apt-get install -y live-helper
fi

## [MEMO] following parameter is for live-helper ...........
###	       -b|--binary-images	iso|net|tar|usb-hdd
###	       --binary-filesystem	fat16|fat32|ext2
###	       --binary-indices		enabled|disabled
###	       --bootstrap-config	FILE
###	       -f|--bootstrap-flavour	minimal|standard
###	       --cache			enabled|disabled
###	       --cache-indices		enabled|disabled
###	       --categories		CATEGORY|"CATEGORIES"
###	       -d|--distribution	CODENAME
###	       --hostname		NAME
###	       -m|--mirror-bootstrap	URL
###	       --mirror-chroot		URL
###	       --mirror-chroot-security URL
###	       --username		NAME

lh clean --binary
# [Note] option '--categories' is only avaible at live-helper 1.0.3-2
lh config -b iso --binary-indices disabled -f minimal --cache enabled --cache-indices enabled -d lenny --hostname hadoop -m http://free.nchc.org.tw/debian --mirror-chroot http://free.nchc.org.tw/debian --mirror-chroot-security http://free.nchc.org.tw/debian-security --mirror-binary http://free.nchc.org.tw/debian --mirror-binary-security http://free.nchc.org.tw/debian-security --username hadoop --packages 'net-tools wireless-tools ssh sudo xserver-xorg-video-vesa xinit xfonts-base x11-xserver-utils xterm openbox iceweasel dhcp3-client' -k 686

cp chroot-hook/* config/chroot_local-hooks/

lh build

if [ -f binary.iso ]; then
  filename=`date +"hadoop-live-%y%m%d%H%M"`
  mv binary.iso "$filename.iso"
  mv binary.packages "$filename.packages"
fi
