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
sudo lh_config -b usb-hdd --binary-indices disabled -f minimal --cache enabled --cache-indices enabled --categories 'main non-free' -d lenny --hostname hadoop -m http://free.nchc.org.tw/debian --mirror-chroot http://free.nchc.org.tw/debian --mirror-chroot-security http://free.nchc.org.tw/debian-security --username hadoop --packages 'gdm openbox'
cat > .xsession << XSESSION
#!/bin/bash
/usr/bin/openbox &
exit
XSESSION
sudo mkdir -p config/chroot_local-includes/etc/skel
sudo mv .xsession config/chroot_local-includes/etc/skel/
sudo lh build
