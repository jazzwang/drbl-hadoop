#!/bin/bash

## Author: Jazz Yao-Tsung Wang <jazzwang.tw@gmail.com>
## 
## v0.1 - 2010-05-23 - initial version
##
## Reference:
## [1] http://live.debian.net/manual/html/packages.html#package-sources
## [2] /opt/drbl/sbin/create-drbl-live (from drbl - http://drbl.sf.net)
## [3] man lh_config and lh_build

###	       -b|--binary-images iso|net|tar|usb-hdd
###	       --binary-filesystem fat16|fat32|ext2
###	       --binary-indices enabled|disabled
###	       --bootstrap-config FILE
###	       -f|--bootstrap-flavour minimal|standard
###	       --cache enabled|disabled
###	       --cache-indices enabled|disabled
###	       --categories CATEGORY|"CATEGORIES"
###	       -d|--distribution CODENAME
###	       --hostname NAME
###	       -m|--mirror-bootstrap URL
###	       --mirror-chroot URL
###	       --mirror-chroot-security URL
###	       --username NAME
sudo lh clean --binary
sudo lh_config -b iso --binary-indices disabled -f minimal --cache enabled --cache-indices enabled --categories 'main non-free' -d lenny --hostname hadoop -m http://free.nchc.org.tw/debian --mirror-chroot http://free.nchc.org.tw/debian --mirror-chroot-security http://free.nchc.org.tw/debian-security --mirror-binary http://free.nchc.org.tw/debian --mirror-binary-security http://free.nchc.org.tw/debian-security --username hadoop --packages 'ssh sudo xserver-xorg-video-vesa xinit xfonts-base x11-xserver-utils xterm openbox iceweasel dhcp3-client' -k 686
sudo lh build
