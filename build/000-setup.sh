#!/bin/sh
#
# Docker Maintainers <docker-maint@echip.io>
#
# @filename: 000-setup.sh
#

set -e

##
## UPGRADING OS
##

cp /etc/apt/sources.list /etc/apt/sources.list.origin

cat /etc/apt/sources.list.origin \
| sed 's|deb http://httpredir.debian.org/debian jessie main|& contrib non-free|1' \
| sed 's|deb http://httpredir.debian.org/debian jessie-updates main|& contrib non-free|1' \
| sed 's|deb http://security.debian.org jessie/updates main|& contrib non-free|1' \
> /etc/apt/sources.list

apt-get update
apt-get dist-upgrade -y


##
## DO SOMETHING
##

apt-get install -y wget


##
## DOCKERIZE SYSTEMD
##

$HOME/.build~/dockerize-systemd.sh
$HOME/.build~/linux-etc-skel.sh


##
## CLEANUP
##

$HOME/.build~/sys-cleanup.sh

